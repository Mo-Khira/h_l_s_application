// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/app_router.dart';
import 'package:h_l_s_application/core/utils/assets.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_login_button.dart';
import 'package:h_l_s_application/features/user_details/data/user_info_cubit.dart';

class UserFitnessGoalPage extends StatefulWidget {
  const UserFitnessGoalPage({super.key});

  @override
  _UserFitnessGoalPage createState() => _UserFitnessGoalPage();
}

class _UserFitnessGoalPage extends State<UserFitnessGoalPage> {
  String? selectedLevel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
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
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "What's your ",
                    style: Styles.textStyle20
                        .copyWith(fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "Goal ",
                    style: Styles.textStyle20.copyWith(
                      fontWeight: FontWeight.w600,
                      color: kSecondaryColor,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "?",
                    style: Styles.textStyle20
                        .copyWith(fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              SizedBox(
                height: kHeight(context) * 0.1,
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
                      const SizedBox(height: 50), // Adjusted margin
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
                      const SizedBox(height: 50), // Adjusted margin
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
                  if (selectedLevel == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please select your fitness level"),
                        backgroundColor: Colors.orangeAccent,
                      ),
                    );
                    return;
                  }
                  context
                      .read<UserInfoCubit>()
                      .setFitnessGoalLevel(selectedLevel!);
                  GoRouter.of(context).pushReplacement(
                    '${AppRouter.kUserInfoInputs}/${AppRouter.kUserActivityLevelPage}',
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
            ],
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
        duration: const Duration(milliseconds: 300),
        width: kWidth(context) * 0.9,
        height: 65,
        margin: const EdgeInsets.only(bottom: 30),
        decoration: BoxDecoration(
          color: isSelected ? kSecondaryColor : kPrimaryColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white, width: 1.5),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedOpacity(
                opacity: isSelected ? 1.0 : 0.5,
                duration: const Duration(milliseconds: 300),
                child: Image.asset(
                  imagePath,
                  width: 24,
                  height: 24,
                  color: isSelected ? Colors.black : null,
                ),
              ),
              const SizedBox(width: 20),
              Text(
                level,
                style: Styles.textStyle20.copyWith(
                  color: isSelected ? kPrimaryColor : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
