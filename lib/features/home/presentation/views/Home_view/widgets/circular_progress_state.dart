import 'package:flutter/material.dart';
import 'package:h_l_s_application/constants.dart';

class CustomCircularProgressState extends StatelessWidget {
  final double endPoint;
  final String text1;
  final String text2;
  const CustomCircularProgressState({
    super.key,
    required this.endPoint,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TweenAnimationBuilder(
        tween: Tween(begin: 0.0, end: endPoint),
        duration: const Duration(seconds: 4),
        builder: (context, value, child) {
          return SizedBox(
            width: kWidth(context) * 0.3,
            height: kWidth(context) * 0.3,
            child: Stack(
              children: [
                ShaderMask(
                  shaderCallback: (rect) {
                    return SweepGradient(
                      startAngle: 0.0,
                      endAngle: 3.14 * 2,
                      stops: [value, value],
                      center: Alignment.center,
                      colors: const [
                        kSecondaryColor,
                        kPrimaryColor,
                      ],
                    ).createShader(rect);
                  },
                  child: Container(
                    width: kWidth(context) * 0.3,
                    height: kWidth(context) * 0.3,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: kWidth(context) * 0.25,
                    height: kWidth(context) * 0.25,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            text1,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            text2,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
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
