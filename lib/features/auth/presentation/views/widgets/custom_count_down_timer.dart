import 'dart:async';
import 'package:flutter/material.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/styles.dart';

class CustomCountdownTimer extends StatefulWidget {
  const CustomCountdownTimer({super.key});

  @override
  State<CustomCountdownTimer> createState() => CustomCountdownTimerState();
}

class CustomCountdownTimerState extends State<CustomCountdownTimer> {
  int secondsRemaining = 60; // مدة العداد (60 ثانية)
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        timer.cancel(); // يوقف العداد عند انتهاء الوقت
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel(); // تأكد من إيقاف العداد عند إغلاق الصفحة
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime =
        "${secondsRemaining ~/ 60}:${(secondsRemaining % 60).toString().padLeft(2, '0')}";

    return Center(
      child: Text(formattedTime,
          style: Styles.textStyle14.copyWith(color: kSecondaryColor)),
    );
  }
}
