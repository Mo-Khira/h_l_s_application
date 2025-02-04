import 'package:flutter/material.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/styles.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.animationController,
    required this.slidingAnimation,
  });

  final AnimationController animationController;
  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, _) {
        return SlideTransition(
          position: slidingAnimation,
          child: Text(
              textAlign: TextAlign.center,
              "H.L.Style",
              style: Styles.textStyle40
              // .copyWith(color: kSecondaryColor),
              ),
        );
      },
    );
  }
}
