// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

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

  static Future<void> scanMeal(BuildContext context) async {
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

        mealResult = labels.map((e) => e.label).join(', ');

        addToHistory('Meal Detected: $mealResult');

        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("Meal Detected"),
            content: Text(mealResult!),
          ),
        );
      }
    } catch (e) {
      log("Meal Scan Error: $e");
    }
  }

  static Future<void> scanBarcode(BuildContext context) async {
    try {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(title: const Text("Scan Barcode")),
            body: MobileScanner(
              onDetect: (capture) async {
                final barcode = capture.barcodes.first;
                if (barcode.rawValue != null) {
                  barcodeResult = barcode.rawValue!;
                  Navigator.of(context).pop();

                  final response = await http.get(
                    Uri.parse(
                        "https://world.openfoodfacts.org/api/v0/product/$barcodeResult.json"),
                  );

                  if (response.statusCode == 200) {
                    final data = json.decode(response.body);
                    final product = data['product'];
                    final name = product?['product_name'] ?? 'Unknown Product';
                    final calories = product?['nutriments']?['energy-kcal_100g']
                            ?.toString() ??
                        'N/A';

                    addToHistory('$name - $calories kcal');

                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text("Product Info"),
                        content: Text('$name\nCalories: $calories kcal'),
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (_) => const AlertDialog(
                        title: Text("Error"),
                        content: Text("Could not fetch product info."),
                      ),
                    );
                  }
                }
              },
            ),
          ),
        ),
      );
    } catch (e) {
      log("Barcode Scan Error: $e");
    }
  }
}
