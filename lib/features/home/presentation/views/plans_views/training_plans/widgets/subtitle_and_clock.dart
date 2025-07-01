import 'package:flutter/material.dart';
import 'package:h_l_s_application/core/utils/styles.dart';

Widget buildSubtitleAndClock(String duration, String subtitle) {
  return Center(
    child: SizedBox(
      width: double.infinity,
      height: 28,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.access_time, color: Colors.white, size: 20),
          const SizedBox(width: 10),
          Text(duration, style: Styles.textStyle18),
          Container(
            width: 1,
            height: 16,
            color: Colors.white,
            margin: const EdgeInsets.symmetric(horizontal: 20),
          ),
          Text(subtitle, style: Styles.textStyle18),
        ],
      ),
    ),
  );
}
