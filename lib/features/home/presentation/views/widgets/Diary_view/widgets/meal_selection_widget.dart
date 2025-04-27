import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MealSelectionWidget extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback? onTap;

  const MealSelectionWidget({
    super.key,
    required this.title,
    required this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Background Image
              Container(
                width: screenWidth * 0.9, // 90% of screen width
                height: screenHeight * 0.1, // 10% of screen height
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      screenWidth * 0.04), // Scaled border radius
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.15),
                      BlendMode.darken,
                    ),
                  ),
                ),
              ),
              // White overlay with opacity
              Container(
                width: screenWidth * 0.9,
                height: screenHeight * 0.1,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(screenWidth * 0.04),
                ),
              ),
              // Text and Icon
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05), // 5% of screen width
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.045, // Responsive font size
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF000000), // Black text
                        height: 1.0, // 100% line height
                      ),
                    ),
                    Container(
                      width: screenWidth * 0.08,
                      height: screenWidth * 0.08,
                      decoration: BoxDecoration(
                        color: const Color(0xFF9EFF00),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.black,
                        size: screenWidth * 0.05, // Responsive icon size
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: screenHeight * 0.01), // 1% of screen height
      ],
    );
  }
}
