import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:h_l_s_application/features/home/presentation/views/plans_views/training_plans/data/workouts_cubit.dart';
import 'package:h_l_s_application/features/home/presentation/views/plans_views/training_plans/training_detail_screen.dart';
import 'package:h_l_s_application/features/home/presentation/views/plans_views/training_plans/training_list.dart';
import 'widgets/training_plan_card.dart';

class TrainingPlansPage extends StatelessWidget {
  const TrainingPlansPage({super.key});

  @override
  Widget build(BuildContext context) {
    final trainingPlans = context.watch<WorkoutsCubit>().state;
    final fallbackPlans = WorkoutsCubit.getStaticWorkouts();
    final safePlans = trainingPlans.isEmpty ? fallbackPlans : trainingPlans;
    final List<String> commonExercises = getCommonExercises();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
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
                  ],
                ),
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
                  itemCount: safePlans.length,
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
