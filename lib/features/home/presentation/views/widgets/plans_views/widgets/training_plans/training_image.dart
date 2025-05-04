import 'package:flutter/material.dart';

class TrainingImage extends StatelessWidget {
  final String imagePath;

  const TrainingImage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 80), // Adjust as needed
      alignment: Alignment.topCenter,
      child: Image.asset(imagePath, width: 380, height: 245),
    );
  }
}
