import 'package:flutter/material.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/styles.dart';

class TimerCircle extends StatelessWidget {
  final double progressValue;
  final String timeLeft;
  final String totalTime;

  const TimerCircle({
    super.key,
    required this.progressValue,
    required this.timeLeft,
    required this.totalTime,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: kWidth(context) * 0.3,
                height: kWidth(context) * 0.3,
                child: CircularProgressIndicator(
                  strokeWidth: 8,
                  value: progressValue,
                  backgroundColor: Colors.white,
                  valueColor: const AlwaysStoppedAnimation(kSecondaryColor),
                ),
              ),
              Text(timeLeft, style: Styles.textStyle20),
              const SizedBox(height: 16),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(totalTime, style: Styles.textStyle18),
        ],
      ),
    );
  }
}
