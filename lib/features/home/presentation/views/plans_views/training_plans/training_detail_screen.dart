import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_login_button.dart';
import 'package:h_l_s_application/features/home/presentation/views/plans_views/training_plans/widgets/favorite_button.dart';
import 'package:h_l_s_application/features/home/presentation/views/plans_views/training_plans/training_progress_screen.dart';
import 'widgets/exercise_list.dart';
import 'widgets/subtitle_and_clock.dart';

class TrainingDetailScreen extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String duration;
  final List<String> exercises;
  final int selectedIndex; // ✅ Add this line

  const TrainingDetailScreen({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.duration,
    required this.exercises,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: GoRouter.of(context).pop,
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                      const Spacer(),
                      FavoriteWorkoutButton(
                        workout: {
                          'title': title,
                          'subtitle': subtitle,
                          'image': imagePath,
                          'calories': 200,
                          'time': duration.replaceAll(" min", ""),
                        },
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: kHeight(context) * 0.06),
                Image.asset(imagePath, width: double.infinity, height: 245),
                SizedBox(height: kHeight(context) * 0.06),
                buildSubtitleAndClock(duration, subtitle),
                SizedBox(height: kHeight(context) * 0.06),
                buildExerciseList(exercises),
                // const Spacer(),
                SizedBox(height: kHeight(context) * 0.05),
                CustomLoginButton(
                  text: "Start Exercise",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TrainingProgressScreen(startIndex: selectedIndex),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
