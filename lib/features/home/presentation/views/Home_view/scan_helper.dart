// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanHelper {
  static String? mealResult;
  static String? barcodeResult;

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
              onDetect: (capture) {
                final barcode = capture.barcodes.first;
                if (barcode.rawValue != null) {
                  barcodeResult = barcode.rawValue!;
                  Navigator.of(context).pop();
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text("Barcode Detected"),
                      content: Text(barcodeResult!),
                    ),
                  );
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
