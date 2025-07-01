// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/styles.dart';

class HeartBeatAnimation extends StatefulWidget {
  const HeartBeatAnimation({super.key});

  @override
  _HeartBeatAnimationState createState() => _HeartBeatAnimationState();
}

class _HeartBeatAnimationState extends State<HeartBeatAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: 1 + (_controller.value * 0.3),
              child: const Icon(
                Icons.favorite,
                color: kSecondaryColor,
                size: 100,
              ),
            );
          },
        ),
        Text(
          "115",
          style: Styles.textStyle16.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          "bmp",
          style: Styles.textStyle12.copyWith(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
