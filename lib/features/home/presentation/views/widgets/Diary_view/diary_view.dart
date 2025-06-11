import 'package:flutter/material.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_login_button.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/Diary_view/widgets/custom_build_calander.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/Diary_view/widgets/meal_selection_widget.dart';

class DiaryView extends StatefulWidget {
  const DiaryView({super.key});

  @override
  State<DiaryView> createState() => _DiaryViewState();
}

class _DiaryViewState extends State<DiaryView> {
  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay.now();

  bool isReminderOn = true;

  void _onDateSelected(DateTime newDate) {
    setState(() => selectedDate = newDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
            children: [
              SizedBox(height: kHeight(context) * 0.1),
              CustomBuildCalender(
                // onDateSelected: (DateTime) {},
                onDateSelected: _onDateSelected,
                selectedDate: selectedDate,
              ), // Custom calendar widget
              const SizedBox(height: 10),
              const Column(
                children: [
                  MealSelectionWidget(
                      title: "Breakfast", imagePath: "assets/Images/test1.png"),
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
              SizedBox(height: kHeight(context) * 0.04), // 4% of screen height

              // Responsive "Complete Diary" Button
              CustomLoginButton(text: "Complete Diary"),
              SizedBox(
                  height: kHeight(context) *
                      0.04), // 4% of screen height// Space after button
            ],
          ),
        ),
      ),
    );
  }
}
