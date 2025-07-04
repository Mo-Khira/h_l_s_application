import 'package:flutter/material.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/assets.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_login_button.dart';
import 'package:h_l_s_application/features/home/presentation/views/Diary_view/widgets/custom_build_calendar.dart';
import 'package:h_l_s_application/features/home/presentation/views/Diary_view/widgets/meal_selection_widget.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(height: kHeight(context) * 0.1),
              CustomBuildCalendar(
                // onDateSelected: (DateTime) {},
                onDateSelected: _onDateSelected,
                selectedDate: selectedDate,
              ), // Custom calendar widget
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Calories Remaining",
                    style: Styles.textStyle14,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "2500",
                        style: Styles.textStyle16,
                      ),
                      Text(
                        "-",
                        style: Styles.textStyle16,
                      ),
                      Text(
                        "816",
                        style: Styles.textStyle16,
                      ),
                      Text(
                        "=",
                        style: Styles.textStyle16,
                      ),
                      Text(
                        "1684",
                        style: Styles.textStyle16,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "    Goal  ",
                        style: Styles.textStyle14,
                      ),
                      Text(
                        "     Food",
                        style: Styles.textStyle14,
                      ),
                      Text(
                        "Remaining",
                        style: Styles.textStyle14,
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(
                height: 30,
              ),
              const Column(
                children: [
                  MealSelectionWidget(
                      title: "Breakfast",
                      imagePath: "assets/Images/img (5).png"),
                  SizedBox(height: 20),
                  MealSelectionWidget(
                      title: "Lunch",
                      imagePath: "assets/Images/Curry Salmon 3.png"),
                  SizedBox(height: 20),
                  MealSelectionWidget(
                      title: "Dinner", imagePath: "assets/Images/img (4).png"),
                  SizedBox(height: 70),
                  MealSelectionWidget(
                      title: "Add Exercise", imagePath: AssetsData.screen3),
                ],
              ),
              SizedBox(height: kHeight(context) * 0.04),
              CustomLoginButton(text: "Complete Diary"),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
