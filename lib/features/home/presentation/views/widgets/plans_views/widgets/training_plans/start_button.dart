import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/plans_views/training_plans/training_progress_screen.dart';

Widget buildStartButton(BuildContext context, int selectedIndex) {
  return SizedBox(
    width: double.infinity,
    height: 60,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF9EFF00),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                TrainingProgressScreen(startIndex: selectedIndex),
          ),
        );
      },
      child: Text(
        "Start Exercise",
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: Colors.black,
        ),
      ),
    ),
  );
}
