import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildExerciseList(List<String> exercises) {
  return Container(
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Exercises",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: const Color(0xFF9EFF00),
          ),
        ),
        const SizedBox(height: 10),
        ...exercises.map(
          (exercise) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text("• $exercise", style: _exerciseItemStyle()),
          ),
        ),
      ],
    ),
  );
}

TextStyle _exerciseItemStyle() {
  return GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 20,
    height: 1.5,
    letterSpacing: 0,
    color: Colors.white,
  );
}
