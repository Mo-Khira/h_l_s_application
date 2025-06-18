import 'package:flutter/material.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/plans_views/widgets/meals_plans/favorite_button.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/plans_views/widgets/meals_plans/header_image.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/plans_views/widgets/meals_plans/ingredients_section.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/plans_views/widgets/meals_plans/meal_info_row.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/plans_views/widgets/meals_plans/nutrition_info.dart';

class MealsDetails extends StatelessWidget {
  final String imagePath;
  final List<String> ingredients;
  final String calories;
  final String cookTime;
  final String fat;
  final String protein;
  final String carbs;

  const MealsDetails({
    super.key,
    required this.imagePath,
    required this.ingredients,
    required this.calories,
    required this.cookTime,
    required this.carbs,
    required this.fat,
    required this.protein,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              children: [
                Stack(
                  children: [
                    HeaderImage(imagePath: imagePath),
                    const FavoriteButton(),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                MealInfoRow(calories: calories, cookTime: cookTime),
                const SizedBox(
                  height: 55,
                ),
                NutritionInfo(fat: fat, protein: protein, carbs: carbs),
                const SizedBox(
                  height: 50,
                ),
                IngredientsSection(ingredients: ingredients),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
