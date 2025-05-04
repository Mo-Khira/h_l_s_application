import 'package:flutter/material.dart';

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
    final size = 150.0;

    // Debug: Print the value of endPoint
    print('endPoint: $endPoint');

    return Center(
      child: TweenAnimationBuilder(
        tween: Tween(begin: 0.0, end: endPoint),
        duration: Duration(seconds: 4),
        builder: (context, value, child) {
          // Debug: Print the value of `value`
          print('TweenAnimationBuilder value: $value');

          return SizedBox(
            width: size,
            height: size,
            child: Stack(
              children: [
                ShaderMask(
                  shaderCallback: (rect) {
                    return SweepGradient(
                      startAngle: 0.0,
                      endAngle: 3.14 * 2,
                      stops: [value, value],
                      center: Alignment.center,
                      colors: [
                        Color(0xff9EFF00),
                        Color(0xff171515),
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
                Center(
                  child: Container(
                    width: size - 40,
                    height: size - 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            text1,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            text2,
                            style: TextStyle(
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
