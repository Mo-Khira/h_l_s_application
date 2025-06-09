import 'package:flutter/material.dart';
import 'package:h_l_s_application/constants.dart';

class HeaderImage extends StatelessWidget {
  final String imagePath;

  const HeaderImage({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: 0,
      width: kWidth(context),
      height: kWidth(context) * 0.66,
      child: Image.asset(
        imagePath,
        width: kWidth(context),
        height: kWidth(context) * 0.66,
        fit: BoxFit.cover,
      ),
    );
  }
}
