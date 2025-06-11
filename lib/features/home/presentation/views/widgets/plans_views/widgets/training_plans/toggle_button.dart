import 'package:flutter/material.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/styles.dart';

class ToggleButton extends StatelessWidget {
  final bool isRunning;
  final VoidCallback onTap;

  const ToggleButton({super.key, required this.isRunning, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: kWidth(context) * 0.25,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: kSecondaryColor),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                isRunning ? Icons.pause : Icons.play_arrow,
                color: Colors.white,
                size: 18,
              ),
              Text(
                isRunning ? "Stop" : "Start",
                style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
