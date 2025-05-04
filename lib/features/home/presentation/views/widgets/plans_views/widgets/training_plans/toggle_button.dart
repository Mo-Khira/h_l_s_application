import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ToggleButton extends StatelessWidget {
  final bool isRunning;
  final VoidCallback onTap;

  const ToggleButton({Key? key, required this.isRunning, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFF9EFF00)),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isRunning ? Icons.pause : Icons.play_arrow,
                color: Colors.white,
                size: 18,
              ),
              const SizedBox(width: 4),
              Text(
                isRunning ? "Stop" : "Start",
                style: GoogleFonts.poppins(
                  color: Colors.white,
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
