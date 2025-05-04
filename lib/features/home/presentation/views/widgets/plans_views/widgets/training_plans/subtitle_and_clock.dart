import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildSubtitleAndClock(String duration, String subtitle) {
  return Center(
    child: Container(
      width: 247,
      height: 28,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTimeRow(duration),
          _buildVerticalDivider(),
          _buildSubtitleRow(subtitle),
        ],
      ),
    ),
  );
}

Widget _buildTimeRow(String duration) {
  return Row(
    children: [
      Icon(Icons.access_time, color: Colors.white, size: 24),
      const SizedBox(width: 5),
      Text(
        duration,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    ],
  );
}

Widget _buildVerticalDivider() {
  return Container(
    width: 1,
    height: 16,
    color: Colors.white,
    margin: const EdgeInsets.symmetric(horizontal: 10),
  );
}

Widget _buildSubtitleRow(String subtitle) {
  return Row(
    children: [
      Text(
        subtitle,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    ],
  );
}
