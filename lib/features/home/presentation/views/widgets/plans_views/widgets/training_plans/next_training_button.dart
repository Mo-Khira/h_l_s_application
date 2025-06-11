import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/styles.dart';

class NextTrainingButton extends StatelessWidget {
  final VoidCallback onTap;

  const NextTrainingButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: kWidth(context) * 0.4,
        height: 60,
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(Icons.directions_run, color: kPrimaryColor, size: 20),
              Text(
                "Next Training",
                style: Styles.textStyle16.copyWith(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
