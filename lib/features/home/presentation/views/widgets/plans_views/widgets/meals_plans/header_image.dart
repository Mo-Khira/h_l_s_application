import 'package:flutter/material.dart';

class HeaderImage extends StatelessWidget {
  final String imagePath;

  const HeaderImage({
    super.key,
    required this.imagePath,
  }); // 👈 accept imagePath

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double imageHeight = screenHeight * 0.35;

    return Positioned(
      left: 0,
      top: 0,
      width: screenWidth,
      height: imageHeight,
      child: Image.asset(
        imagePath, // 👈 use the passed image
        width: screenWidth,
        height: imageHeight,
        fit: BoxFit.cover,
      ),
    );
  }
}
