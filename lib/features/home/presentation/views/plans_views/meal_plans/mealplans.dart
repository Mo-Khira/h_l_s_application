import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:h_l_s_application/features/home/presentation/views/plans_views/meal_plans/data/meal_cubit.dart';
import 'package:h_l_s_application/features/home/presentation/views/plans_views/meal_plans/meal_list.dart';
import 'package:h_l_s_application/features/home/presentation/views/plans_views/meal_plans/meals_details.dart';
import 'widgets/meal_card_item.dart';

class MealPlans extends StatelessWidget {
  const MealPlans({super.key});

  @override
  Widget build(BuildContext context) {
    final meals = context.watch<MealsCubit>().state;
    final safeMeals = meals.isEmpty ? getStaticMeals() : meals;

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
              ...safeMeals.map((meal) {
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
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
