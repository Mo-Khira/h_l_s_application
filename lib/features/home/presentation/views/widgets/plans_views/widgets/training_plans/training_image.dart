import 'package:flutter/material.dart';
import 'package:h_l_s_application/constants.dart';

class TrainingImage extends StatelessWidget {
  final String imagePath;

  const TrainingImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(imagePath,
        width: kWidth(context), height: kWidth(context) * 0.6);
  }
}
