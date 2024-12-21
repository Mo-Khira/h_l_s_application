// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:h_l_s_application/constants.dart';

class BeginScreenBar extends StatelessWidget {
  const BeginScreenBar(
      {super.key, required this.widthKey, required this.colorKey});

  final double widthKey;
  final int colorKey;

  @override
  Widget build(BuildContext context) {
    Color selectedBarColor4;
    if (colorKey == 1) {
      selectedBarColor4 = kSecondaryColor;
    } else {
      selectedBarColor4 = Colors.white;
    }

    var selectedActiveBar;
    if (widthKey == 1) {
      selectedActiveBar = 30.toDouble();
    } else {
      selectedActiveBar = 20.toDouble();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 4,
          width: selectedActiveBar,
          decoration: BoxDecoration(
            color: selectedBarColor4,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        const SizedBox(
          width: 4,
        ),
      ],
    );
  }
}
