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
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(40),
            ),
            child: SizedBox(
              height: 926,
              child: Stack(
                children: [
                  HeaderImage(imagePath: imagePath),
                  const FavoriteButton(),
                  NutritionInfo(fat: fat, protein: protein, carbs: carbs),
                  MealInfoRow(calories: calories, cookTime: cookTime),
                  IngredientsSection(ingredients: ingredients),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
