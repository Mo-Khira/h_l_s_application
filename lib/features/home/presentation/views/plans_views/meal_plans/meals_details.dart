import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/features/home/presentation/views/plans_views/meal_plans/widgets/favorite_button.dart';
import 'package:h_l_s_application/features/home/presentation/views/plans_views/meal_plans/widgets/header_image.dart';
import 'package:h_l_s_application/features/home/presentation/views/plans_views/meal_plans/widgets/ingredients_section.dart';
import 'package:h_l_s_application/features/home/presentation/views/plans_views/meal_plans/widgets/meal_info_row.dart';
import 'package:h_l_s_application/features/home/presentation/views/plans_views/meal_plans/widgets/nutrition_info.dart';

class MealsDetails extends StatelessWidget {
  final String imagePath;
  final List<String> ingredients;
  final String calories;
  final String cookTime;
  final String fat;
  final String protein;
  final String carbs;
  final String title;

  const MealsDetails({
    super.key,
    required this.imagePath,
    required this.ingredients,
    required this.calories,
    required this.cookTime,
    required this.carbs,
    required this.fat,
    required this.protein,
    required this.title, // 👈 إضافة
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          padding: const EdgeInsetsDirectional.all(18),
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 28,
                          ),
                          onPressed: () {
                            GoRouter.of(context).pop();
                          },
                        ),
                        const Spacer(),
                        FavoriteButton(
                          meal: {
                            'image': imagePath,
                            'title': title,
                            'calories': calories,
                            'time': cookTime,
                          },
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                      ],
                    ),
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
