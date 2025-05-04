import 'package:flutter/material.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/plans_views/widgets/training_plans/training_image_details.dart';
import '../widgets/training_plans/exercise_list.dart';
import '../widgets/training_plans/subtitle_and_clock.dart';
import '../widgets/training_plans/start_button.dart';

class TrainingDetailScreen extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String duration;
  final List<String> exercises;
  final int selectedIndex; // ✅ Add this line

  const TrainingDetailScreen({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.duration,
    required this.exercises,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 68),
                buildImage(imagePath),
                const SizedBox(height: 51),
                buildSubtitleAndClock(duration, subtitle),
                const SizedBox(height: 60),
                buildExerciseList(exercises),
                // const Spacer(),
                const SizedBox(height: 60),

                buildStartButton(context, selectedIndex),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
