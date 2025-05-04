import 'package:flutter/material.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/Home_view/widgets/heart_pulse.dart';

class Trial extends StatelessWidget {
  const Trial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [HeartBeatAnimation()],
        ),
      ),
    );
  }
}
