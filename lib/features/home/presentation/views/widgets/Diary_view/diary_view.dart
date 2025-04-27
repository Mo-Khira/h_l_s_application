import 'package:flutter/material.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/Diary_view/widgets/custom_build_calander.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/Diary_view/widgets/meal_selection_widget.dart';

class DiaryView extends StatelessWidget {
  const DiaryView({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width and height for responsiveness
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 80),
              customBuildCalender(), // Custom calendar widget
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 18),
                child: Column(
                  children: const [
                    MealSelectionWidget(
                        title: "Breakfast",
                        imagePath: "assets/Images/test1.png"),
                    SizedBox(height: 20),
                    MealSelectionWidget(
                        title: "Lunch", imagePath: "assets/Images/test1.png"),
                    SizedBox(height: 20),
                    MealSelectionWidget(
                        title: "Dinner", imagePath: "assets/Images/test1.png"),
                    SizedBox(height: 70),
                    MealSelectionWidget(
                        title: "Add Exercise",
                        imagePath: "assets/Images/test1.png"),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.04), // 4% of screen height

              // Responsive "Complete Diary" Button
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.05), // 5% of screen width
                  child: GestureDetector(
                    onTap: () {
                      print("Complete Diary button clicked");
                    },
                    child: Container(
                      width: screenWidth * 0.9, // 90% of screen width
                      height: screenHeight * 0.08, // 8% of screen height
                      decoration: BoxDecoration(
                        color:
                            const Color(0xFF9EFF00), // Button background color
                        borderRadius: BorderRadius.circular(
                            screenWidth * 0.03), // Responsive border radius
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Complete Diary",
                        style: TextStyle(
                          fontSize: screenWidth * 0.05, // Responsive font size
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF171515), // Text color
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                  height: screenHeight *
                      0.04), // 4% of screen height// Space after button
            ],
          ),
        ),
      ),
    );
  }
}
