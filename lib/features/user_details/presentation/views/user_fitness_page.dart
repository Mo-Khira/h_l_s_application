import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/app_router.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_login_button.dart';

class UserFitnessPage extends StatefulWidget {
  @override
  _UserFitnessPage createState() => _UserFitnessPage();
}

class _UserFitnessPage extends State<UserFitnessPage> {
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
                      "What's your fitness level ?",
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
                          level: 'Beginner',
                          isSelected: selectedLevel == 'Beginner',
                          onSelect: () {
                            setState(() {
                              selectedLevel = 'Beginner';
                            });
                          },
                        ),
                        const SizedBox(height: 50), // Adjusted margin
                        FitnessLevelButton(
                          level: 'Intermediate',
                          isSelected: selectedLevel == 'Intermediate',
                          onSelect: () {
                            setState(() {
                              selectedLevel = 'Intermediate';
                            });
                          },
                        ),
                        const SizedBox(height: 50), // Adjusted margin
                        FitnessLevelButton(
                          level: 'Advanced',
                          isSelected: selectedLevel == 'Advanced',
                          onSelect: () {
                            setState(() {
                              selectedLevel = 'Advanced';
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
                    GoRouter.of(context).push(AppRouter.kUserFitnessGoalPage);
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
  final bool isSelected;
  final VoidCallback onSelect;

  const FitnessLevelButton({
    required this.level,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300), // Smooth transition
        width: 330,
        height: 65,
        margin: EdgeInsets.only(bottom: 30), // Adjusted margin
        decoration: BoxDecoration(
          color: isSelected
              ? kSecondaryColor
              : kPrimaryColor, // Background color change
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white, width: 1.5),
        ),
        child: Center(
          child: Text(
            level,
            style: Styles.textStyle20.copyWith(
                color: isSelected ? Colors.black : Colors.white, height: 1.5),
          ),
        ),
      ),
    );
  }
}
