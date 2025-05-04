import 'package:flutter/material.dart';

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
                color: Color(0xff9EFF00),
                size: 100,
              ),
            );
          },
        ),
        Text(
          "115",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        Text(
          "bmp",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
