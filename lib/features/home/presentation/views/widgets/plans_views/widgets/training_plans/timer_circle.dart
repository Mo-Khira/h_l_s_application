import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimerCircle extends StatelessWidget {
  final double progressValue;
  final String timeLeft;
  final String totalTime;

  const TimerCircle({
    Key? key,
    required this.progressValue,
    required this.timeLeft,
    required this.totalTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 395,
      left: 131,
      child: SizedBox(
        width: 165,
        height: 210,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: CircularProgressIndicator(
                    strokeWidth: 8,
                    value: progressValue,
                    backgroundColor: Colors.white,
                    valueColor: const AlwaysStoppedAnimation(Color(0xFF9EFF00)),
                  ),
                ),
                Text(
                  timeLeft,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              totalTime,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
