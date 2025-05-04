import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextTrainingButton extends StatelessWidget {
  final VoidCallback onTap;

  const NextTrainingButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 174,
        height: 60,
        decoration: BoxDecoration(
          color: const Color(0xFF9EFF00),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.directions_run, color: Colors.black, size: 20),
              const SizedBox(width: 8),
              Text(
                "Next Training",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
