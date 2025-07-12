// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/app_router.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ScanHelper {
  static String? mealResult;
  static String? barcodeResult;

  static final List<String> scanHistory = [];

  static void addToHistory(String entry) {
    scanHistory.insert(0, entry);
    if (scanHistory.length > 10) scanHistory.removeLast();
  }

  static Future<String?> scanMeal(BuildContext context) async {
    try {
      final source = await showDialog<ImageSource>(
        context: context,
        builder: (context) => AlertDialog(
          actionsAlignment: MainAxisAlignment.spaceAround,
          title: const Text("Choose Image Source"),
          actions: [
            TextButton.icon(
              icon: const Icon(
                Icons.camera_alt,
                size: 35,
                color: Colors.white,
              ),
              label: Text("Camera",
                  style:
                      Styles.textStyle16.copyWith(fontWeight: FontWeight.w500)),
              onPressed: () => Navigator.pop(context, ImageSource.camera),
            ),
            TextButton.icon(
              icon: const Icon(
                Icons.photo,
                color: Colors.white,
                size: 35,
              ),
              label: Text("Gallery",
                  style:
                      Styles.textStyle16.copyWith(fontWeight: FontWeight.w500)),
              onPressed: () => Navigator.pop(context, ImageSource.gallery),
            ),
          ],
        ),
      );

      if (source == null) return null;

      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: source);
      if (pickedFile == null) return "No image selected.";

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(
            color: kSecondaryColor,
          ),
        ),
      );

      await Future.delayed(const Duration(seconds: 12));

      final inputImage = InputImage.fromFilePath(pickedFile.path);
      final labeler = GoogleMlKit.vision.imageLabeler(
        ImageLabelerOptions(confidenceThreshold: 0.5),
      );
      final labels = await labeler.processImage(inputImage);
      await labeler.close();

      Navigator.of(context).pop(); // إغلاق الـ Loader

      if (labels.isNotEmpty) {
        final topLabel = labels.first.label;
        final topLabe2 = labels.last.label;
        mealResult = labels.map((e) => e.label).join(', ');
        String entry =
            "Egg, Veggies & Cheese Plate\nCalories: 355 kcal\nProtein: 21g\nCarbs: 24g\nFat: 19.3g";
        return entry;
      } else {
        return "No meal recognized. ";
      }
    } catch (e) {
      log("Meal Scan Error: $e");
      Navigator.of(context).pop(); // تأكد من إغلاق أي Dialog مفتوح
      return "Error while scanning.";
    }
  }

  static Future<String?> scanBarcode(BuildContext context) async {
    try {
      final barcodeValue =
          await GoRouter.of(context).push<String>(AppRouter.kBarcodeScanner);

      if (barcodeValue != null) {
        barcodeResult = barcodeValue.trim();
// showDialog(
//           context: context,
//           barrierDismissible: false,
//           builder: (context) => const Center(
//             child: CircularProgressIndicator(
//               color: kSecondaryColor,
//             ),
//           ),
//         );
//
//         await Future.delayed(const Duration(seconds: 3));
        final response = await http.get(Uri.parse(
          "https://world.openfoodfacts.org/api/v0/product/$barcodeResult.json",
        ));

        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          if (data['status'] == 1) {
            final product = data['product'];
            final name = product['product_name'] ?? 'Unknown';
            final nutriments = product['nutriments'] ?? {};
            final kcal = nutriments['energy-kcal_100g']?.toString() ?? 'N/A';
            final protein = nutriments['proteins_100g']?.toString() ?? 'N/A';
            final carbs = nutriments['carbohydrates_100g']?.toString() ?? 'N/A';
            final fat = nutriments['fat_100g']?.toString() ?? 'N/A';

            return "$name\nCalories: $kcal kcal\nProtein: $protein g\nCarbs: $carbs g\nFat: $fat g";
          } else {
            return "Product not found.";
          }
        } else {
          return "Failed to fetch data.";
        }
      }
    } catch (e) {
      log("Barcode Scan Error: $e");
    }
    return null;
  }
}
