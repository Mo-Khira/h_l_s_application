import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:h_l_s_application/constants.dart';

class CustomCircularProgress extends StatelessWidget {
  const CustomCircularProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TweenAnimationBuilder(
        tween: Tween(begin: 0.0, end: 0.1),
        duration: const Duration(seconds: 4),
        builder: (context, value, child) {
          int percentage = (value * 100).ceil();
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
                    width: kWidth(context) * 0.3,
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
                            "$percentage%",
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          SvgPicture.asset("assets/svgs/heart.svg"),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
