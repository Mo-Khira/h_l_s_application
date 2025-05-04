import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';

class ArcProgress extends StatelessWidget {
  const ArcProgress({super.key});

  @override
  Widget build(BuildContext context) {
    final size = 200.0;
    return Center(
      child: TweenAnimationBuilder(
        tween: Tween(begin: 0.0, end: 0.7),
        duration: Duration(seconds: 4),
        builder: (context, value, child) {
          int percentage = (value * 100).ceil();
          return Container(
            width: size,
            height: size / 2, // Half-circle height
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
                            Color(0xff9EFF00),
                            Colors.grey.withAlpha(55),
                          ],
                        ).createShader(rect);
                      },
                      child: Container(
                        width: size,
                        height: size,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                // Inner white half-circle
                Center(
                  child: Container(
                    width: size - 40,
                    height: (size - 40) / 2, // Inner half-circle
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular((size - 40) / 2),
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
