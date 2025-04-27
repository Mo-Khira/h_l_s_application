// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/app_router.dart';
import 'package:h_l_s_application/core/utils/assets.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_login_button.dart';

class UserFitnessGoalPage extends StatefulWidget {
  const UserFitnessGoalPage({super.key});

  @override
  _UserFitnessGoalPage createState() => _UserFitnessGoalPage();
}

class _UserFitnessGoalPage extends State<UserFitnessGoalPage> {
  String? selectedLevel;

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsive design
    double screenWidth = kWidth(context);
    double screenHeight = kHeight(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      padding: const EdgeInsetsDirectional.all(0),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 28,
                      ),
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kHomeView);
                      },
                      child: Text("Skip",
                          style: Styles.textStyle14.copyWith(
                              color: kSecondaryColor,
                              fontWeight: FontWeight.w700)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "What's your goal ?",
                      style: Styles.textStyle20
                          .copyWith(fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.1,
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black, width: 0), // Outer border
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FitnessLevelButton(
                          level: 'Weight loss',
                          imagePath: AssetsData.weightLossImage,
                          isSelected: selectedLevel == 'Weight loss',
                          onSelect: () {
                            setState(() {
                              selectedLevel = 'Weight loss';
                            });
                          },
                        ),
                        SizedBox(height: 50), // Adjusted margin
                        FitnessLevelButton(
                          level: 'Gain muscle',
                          imagePath: AssetsData.gainMuscleImage,
                          isSelected: selectedLevel == 'Gain muscle',
                          onSelect: () {
                            setState(() {
                              selectedLevel = 'Gain muscle';
                            });
                          },
                        ),
                        SizedBox(height: 50), // Adjusted margin
                        FitnessLevelButton(
                          level: 'Improve fitness',
                          imagePath: AssetsData.improveFitnessImage,
                          isSelected: selectedLevel == 'Improve fitness',
                          onSelect: () {
                            setState(() {
                              selectedLevel = 'Improve fitness';
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                CustomLoginButton(
                  text: "Next Steps",
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.kHomeView);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FitnessLevelButton extends StatelessWidget {
  final String level;
  final String imagePath;

  final bool isSelected;
  final VoidCallback onSelect;

  const FitnessLevelButton({
    required this.level,
    required this.imagePath,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: 330,
        height: 65, //
        margin: EdgeInsets.only(bottom: 30),
        decoration: BoxDecoration(
          color: isSelected ? kSecondaryColor : kPrimaryColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white, width: 1.5),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image inside the box
              AnimatedOpacity(
                opacity:
                    isSelected ? 1.0 : 0.5, // Change opacity based on selection
                duration: Duration(milliseconds: 300),
                child: Image.asset(
                  imagePath,
                  width: 24, // Adjust image size
                  height: 24,
                  color: isSelected
                      ? Colors.black
                      : null, // Change image color to black when selected
                ),
              ),
              SizedBox(width: 20),
              // Text inside the box
              Text(level,
                  style: Styles.textStyle20.copyWith(
                    color: isSelected ? kPrimaryColor : Colors.white,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
