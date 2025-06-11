import 'package:flutter/material.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/styles.dart';

Widget buildExerciseList(List<String> exercises) {
  return SizedBox(
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Exercises",
          style: Styles.textStyle20.copyWith(
            color: kSecondaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        ...exercises.map(
          (exercise) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text("• $exercise", style: Styles.textStyle20),
          ),
        ),
      ],
    ),
  );
}
