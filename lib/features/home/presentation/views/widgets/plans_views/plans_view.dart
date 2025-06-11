import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/app_router.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/plans_views/food_plans/mealplans.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/plans_views/meal_card.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/plans_views/training_plans/training_detail_screen.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/plans_views/training_plans/training_plans_screen.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/plans_views/widgets/meals_plans/training_card_item.dart'; // Updated import

class PlansView extends StatelessWidget {
  const PlansView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _buildBackButton(context),
              const SizedBox(height: 20),
              _buildMealPlansSection(context),
              const SizedBox(height: 16),
              _buildMealList(),
              const SizedBox(height: 20),
              _buildTrainingPlansSection(context),
              const SizedBox(height: 16),
              _buildTrainingCardList(context),
            ],
          ),
        ),
      ),
    );
  }

  // Back Button Widget
  Widget _buildBackButton(BuildContext context) {
    return Row(
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
            GoRouter.of(context).pop();
          },
        ),
      ],
    );
  }

  // Meal Plans Section Widget
  Widget _buildMealPlansSection(BuildContext context) {
    return PlansSection(
      title: 'Meal Plans',
      onSeeAll: () {
        GoRouter.of(context).push(AppRouter.kMealPlans);
      },
    );
  }

  // Training Plans Section Widget
  Widget _buildTrainingPlansSection(BuildContext context) {
    return PlansSection(
      title: 'Training Plans',
      onSeeAll: () {
        GoRouter.of(context).push(AppRouter.kTrainingPlanPage);
      },
    );
  }

  // Meal List Widget
  Widget _buildMealList() {
    final List<Map<String, dynamic>> meals = _getMeals();
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: meals.length,
        itemBuilder: (context, index) {
          final meal = meals[index];
          return MealCard(
            image: meal["image"],
            title: meal["title"],
            calories: meal["calories"],
            // ingredients: meal["ingredients"],
            // cookTime: meal["cookTime"],
            // fat: meal["fat"],
            // protein: meal["protein"],
            // carbs: meal["carbs"],
          );
        },
      ),
    );
  }

  // Training Card List Widget
  Widget _buildTrainingCardList(BuildContext context) {
    final List<Map<String, dynamic>> trainingPlans = _getTrainingPlans();
    final List<String> commonExercises = _getCommonExercises();

    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: trainingPlans.length,
        itemBuilder: (context, index) {
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

  // Sample data for Meal Plans
  List<Map<String, dynamic>> _getMeals() {
    return [
      {
        "image": "assets/Images/img (3).png",
        "title": "Green beans, tomatoes, eggs",
        "calories": "135 kcal",
        "ingredients": [
          '2-3 eggs',
          'A handful of fresh spinach',
          '1 small tomato',
          'Salt and pepper to taste',
          'Olive oil or butter',
        ],
        "cookTime": "5 min",
        "fat": "1.5 g",
        "protein": "10.9 g",
        "carbs": "13.5 g",
      },
      {
        "image": "assets/Images/img (4).png",
        "title": "Greek salad with lettuce, green onion",
        "calories": "150 kcal",
        "ingredients": [
          'Cheese',
          'A handful of fresh spinach',
          'Salt and pepper to taste',
          'Olive oil or butter',
        ],
        "cookTime": "5 min",
        "fat": "1.5 g",
        "protein": "10.9 g",
        "carbs": "13.5 g",
      },
      {
        "image": "assets/Images/img (5).png",
        "title": "Salad of fresh vegetables",
        "calories": "270 kcal",
        "ingredients": [
          'Onion',
          'A handful of fresh spinach',
          '1 small tomato',
          'Salt and pepper to taste',
          'Olive oil or butter',
        ],
        "cookTime": "5 min",
        "fat": "1.5 g",
        "protein": "10.9 g",
        "carbs": "13.5 g",
      },
    ];
  }

  // Sample data for Training Plans
  List<Map<String, dynamic>> _getTrainingPlans() {
    return [
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
    ];
  }

  // Sample common exercises
  List<String> _getCommonExercises() {
    return const [
      "Jumping Jacks",
      "Arm Circles",
      "Leg Swings",
      "Bodyweight Squats",
      "Hip Circles",
      "Torso Twists",
    ];
  }
}

// Reusable PlansSection Widget
class PlansSection extends StatelessWidget {
  final String title;
  final VoidCallback onSeeAll;

  const PlansSection({
    super.key,
    required this.title,
    required this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 27,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Styles.textStyle18,
          ),
          GestureDetector(
            onTap: onSeeAll,
            child: Text('See All',
                style: Styles.textStyle16.copyWith(color: kSecondaryColor)),
          ),
        ],
      ),
    );
  }
}
