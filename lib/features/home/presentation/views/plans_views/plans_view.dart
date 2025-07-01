import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:h_l_s_application/core/utils/app_router.dart';
import 'package:h_l_s_application/features/home/presentation/views/plans_views/widgets/custom_plan_section.dart';
import 'package:h_l_s_application/features/home/presentation/views/plans_views/meal_plans/meal_list.dart';
import 'package:h_l_s_application/features/home/presentation/views/plans_views/meal_plans/meals_details.dart';
import 'package:h_l_s_application/features/home/presentation/views/plans_views/training_plans/training_detail_screen.dart';
import 'package:h_l_s_application/features/home/presentation/views/plans_views/training_plans/training_list.dart';
import 'package:h_l_s_application/features/home/presentation/views/plans_views/meal_plans/widgets/meal_card_item.dart';
import 'package:h_l_s_application/features/home/presentation/views/plans_views/training_plans/training_card_item.dart'; // Updated import

class PlansView extends StatelessWidget {
  const PlansView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        padding: const EdgeInsetsDirectional.all(0),
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 28,
                        ),
                        onPressed: () {
                          GoRouter.of(context)
                              .pushReplacement(AppRouter.kHomeView);
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                PlansSection(
                  title: 'Meal Plans',
                  onSeeAll: () {
                    GoRouter.of(context).push(AppRouter.kMealPlans);
                  },
                ),
                const SizedBox(height: 16),
                _buildMealList(context),
                const SizedBox(height: 20),
                PlansSection(
                  title: 'Training Plans',
                  onSeeAll: () {
                    GoRouter.of(context).push(AppRouter.kTrainingPlanPage);
                  },
                ),
                const SizedBox(height: 16),
                _buildTrainingCardList(context),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMealList(BuildContext context) {
    final meals = getMeals();
    return Column(
      children: List.generate(
        4,
        (index) {
          final meal = meals[index];
          return MealCardItem(
            imagePath: meal.imagePath,
            title: meal.title,
            calories: meal.calories,
            top: meal.top,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MealsDetails(
                    imagePath: meal.imagePath,
                    ingredients: meal.ingredients,
                    calories: meal.calories,
                    cookTime: meal.cookTime,
                    fat: meal.fat,
                    protein: meal.protein,
                    carbs: meal.carbs,
                    title: meal.title,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildTrainingCardList(BuildContext context) {
    final trainingPlans = getTrainingPlans();
    final commonExercises = getCommonExercises();
    return Column(
      children: List.generate(
        4,
        (index) {
          final plan = trainingPlans[index];
          return TrainingCardItem(
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
    );
  }
}
