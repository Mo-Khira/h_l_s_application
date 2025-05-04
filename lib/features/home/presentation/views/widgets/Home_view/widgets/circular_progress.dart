import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCircularProgress extends StatelessWidget {
  const CustomCircularProgress({super.key});

  @override
  Widget build(BuildContext context) {
    final size = 150.0;
    return Center(
        child: TweenAnimationBuilder(
            tween: Tween(begin: 0.0, end: 0.7),
            duration: Duration(seconds: 4),
            builder: (context, value, child) {
              int percentage = (value * 100).ceil();
              return Container(
                width: size,
                height: size,
                // color: Colors.blue,
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
                            shape: BoxShape.circle, color: Colors.white),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: size - 40,
                        height: size - 40,
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "$percentage%",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                              SvgPicture.asset("assets/svgs/heart.svg")
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }));
  }
}
