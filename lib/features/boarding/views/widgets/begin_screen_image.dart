import 'package:flutter/material.dart';

class BeginScreenImage extends StatelessWidget {
  const BeginScreenImage({super.key, required this.selectedImage});

  final selectedImage;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: screenWidth,
      child: Image.asset(selectedImage),
    );
  }
}
