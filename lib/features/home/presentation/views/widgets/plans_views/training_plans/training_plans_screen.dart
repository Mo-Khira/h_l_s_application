import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/plans_views/training_plans/training_detail_screen.dart';
import '../widgets/training_plans/training_plan_card.dart';

class TrainingPlansPage extends StatelessWidget {
  const TrainingPlansPage({super.key});

  final List<Map<String, dynamic>> trainingPlans = const [
    {
      "title": "Full Body Warm Up",
      "subtitle": "20 Exercises • 20 min",
      "cardImage": "assets/Images/Vector 01.png",
      "detailImage": "assets/Images/Vector.png",
      "detailTitle": "Full Body Warm Up",
      "detailSubtitle": "20 Exercises",
      "duration": "20 min",
    },
    {
      "title": "Both Side Plank",
      "subtitle": "18 Exercises • 14 min",
      "cardImage": "assets/Images/Vector 03.png",
      "detailImage": "assets/Images/Group.png",
      "detailTitle": "Full Body Warm Up",
      "detailSubtitle": "18 Exercises",
      "duration": "14 min",
    },
    {
      "title": "Abs Workout",
      "subtitle": "16 Exercises • 18 min",
      "cardImage": "assets/Images/Vector 04.png",
      "detailImage": "assets/Images/Group-1.png",
      "detailTitle": "Full Body Warm Up",
      "detailSubtitle": "16 Exercises",
      "duration": "18 min",
    },
    {
      "title": "Torso and Trap Workout",
      "subtitle": "8 Exercises • 10 min",
      "cardImage": "assets/Images/Vector 04 (1).png",
      "detailImage": "assets/Images/Group-2.png",
      "detailTitle": "Full Body Warm Up",
      "detailSubtitle": "8 Exercises",
      "duration": "10 min",
    },
    {
      "title": "Lower Back Exercise",
      "subtitle": "15 Exercises • 15 min",
      "cardImage": "assets/Images/Vector 04 (2).png",
      "detailImage": "assets/Images/Vector 6.png",
      "detailTitle": "Full Body Warm Up",
      "detailSubtitle": "15 Exercises",
      "duration": "15 min",
    },
    {
      "title": "Strength Exercise",
      "subtitle": "12 Exercises • 14 min",
      "cardImage": "assets/Images/Vector 02.png",
      "detailImage": "assets/Images/Group-3.png",
      "detailTitle": "Full Body Warm Up",
      "detailSubtitle": "12 Exercises",
      "duration": "14 min",
    },
  ];

  final List<String> commonExercises = const [
    "Jumping Jacks",
    "Arm Circles",
    "Leg Swings",
    "Bodyweight Squats",
    "Hip Circles",
    "Torso Twists",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
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
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              Text('Training Plans', style: Styles.textStyle18),
              const SizedBox(
                height: 20,
              ), // List of Training Cards
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: trainingPlans.length,
                  itemBuilder: (context, index) {
                    final plan = trainingPlans[index];
                    return TrainingPlanCard(
                      title: plan["title"],
                      subtitle: plan["subtitle"],
                      imagePath: plan["cardImage"],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => TrainingDetailScreen(
                              imagePath: plan["detailImage"],
                              title: plan["detailTitle"],
                              subtitle: plan["detailSubtitle"],
                              duration: plan["duration"],
                              exercises: commonExercises,
                              selectedIndex: index,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
