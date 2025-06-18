import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/plans_views/food_plans/meal_details.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/plans_views/food_plans/meal_list.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/plans_views/food_plans/meals_details.dart';
import '../widgets/meals_plans/meal_card_item.dart';

class MealPlans extends StatelessWidget {
  const MealPlans({super.key});

  @override
  Widget build(BuildContext context) {
    final meals = getMeals();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
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
              Text('Meal plans', style: Styles.textStyle18),
              const SizedBox(
                height: 20,
              ),
              ...meals.map((meal) {
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
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
