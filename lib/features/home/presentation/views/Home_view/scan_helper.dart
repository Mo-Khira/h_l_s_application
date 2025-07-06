// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:h_l_s_application/core/utils/app_router.dart';
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
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        final inputImage = InputImage.fromFilePath(pickedFile.path);
        final labeler = GoogleMlKit.vision.imageLabeler(
          ImageLabelerOptions(confidenceThreshold: 0.5),
        );
        final labels = await labeler.processImage(inputImage);
        labeler.close();

        if (labels.isNotEmpty) {
          final topLabel = labels.first.label;
          final topLabe2 = labels.last.label;
          mealResult = labels.map((e) => e.label).join(', ');
          String entry =
              "$topLabel ,$topLabe2 \nEstimated Calories: 250 kcal\nProtein: 12g\nCarbs: 30g\nFat: 10g";
          return entry;
        } else {
          return "No meal recognized.";
        }
      }
    } catch (e) {
      log("Meal Scan Error: $e");
    }
    return null;
  }

  static Future<String?> scanBarcode(BuildContext context) async {
    try {
      final barcodeValue =
          await GoRouter.of(context).push<String>(AppRouter.kBarcodeScanner);

      if (barcodeValue != null) {
        barcodeResult = barcodeValue.trim();

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
