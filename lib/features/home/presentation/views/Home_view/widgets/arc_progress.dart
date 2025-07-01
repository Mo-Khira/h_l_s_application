import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';

import 'package:h_l_s_application/constants.dart';

class ArcProgress extends StatelessWidget {
  const ArcProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TweenAnimationBuilder(
        tween: Tween(begin: 0.0, end: 0.7),
        duration: const Duration(seconds: 4),
        builder: (context, value, child) {
          int percentage = (value * 100).ceil();
          return SizedBox(
            width: kWidth(context) * 0.4,
            height: kHeight(context) * 0.3, // Half-circle height
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                // Outer arc progress
                ClipRect(
                  child: Align(
                    alignment: Alignment.topCenter,
                    heightFactor: 0.5, // Clip the bottom half
                    child: ShaderMask(
                      shaderCallback: (rect) {
                        return SweepGradient(
                          startAngle: pi, // Start from the left
                          endAngle: pi * (1 + value), // Fill rightwards
                          stops: [value, value],
                          center: Alignment.bottomCenter,
                          colors: [
                            kSecondaryColor,
                            Colors.grey.withAlpha(55),
                          ],
                        ).createShader(rect);
                      },
                      child: Container(
                        width: kWidth(context) * 0.4,
                        height: kWidth(context) * 0.4,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: kWidth(context) * 0.3,
                    height: kWidth(context) * 0.2, // Inner half-circle
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(kWidth(context) * 0.2),
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("$percentage%"),
                          SvgPicture.asset("assets/svgs/heart.svg"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
