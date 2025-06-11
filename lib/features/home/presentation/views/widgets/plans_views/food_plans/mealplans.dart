import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/plans_views/food_plans/meal_details.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/plans_views/food_plans/meals_details.dart';
import '../widgets/meals_plans/food_card.dart';

class MealPlans extends StatelessWidget {
  const MealPlans({super.key});

  List<Meal> getMeals() {
    return [
      Meal(
        imagePath: 'assets/Images/img (3).png',
        title: 'Green beans, tomatoes, eggs',
        calories: '135 kcal',
        cookTime: '5 min',
        ingredients: [
          '2-3 eggs',
          'A handful of fresh spinach',
          '1 small tomato',
          'Salt and pepper to taste',
          'Olive oil or butter',
        ],
        fat: '1.5 g',
        protein: '10.9 g',
        carbs: '13.5 g',
        top: 181,
      ),
      Meal(
        imagePath: 'assets/Images/img (4).png',
        title: 'Greek salad with lettuce, green onion',
        calories: '150 kcal',
        cookTime: '5 min',
        ingredients: [
          'Cheese',
          'A handful of fresh spinach',
          'Salt and pepper to taste',
          'Olive oil or butter',
        ],
        fat: '1.5 g',
        protein: '10.9 g',
        carbs: '13.5 g',
        top: 285,
      ),
      Meal(
        imagePath: 'assets/Images/img (5).png',
        title: 'Salad of fresh vegetables',
        calories: '270 kcal',
        cookTime: '5 min',
        ingredients: [
          'Onion',
          'A handful of fresh spinach',
          '1 small tomato',
          'Salt and pepper to taste',
          'Olive oil or butter',
        ],
        fat: '1.5 g',
        protein: '10.9 g',
        carbs: '13.5 g',
        top: 389,
      ),
      Meal(
        imagePath: 'assets/Images/avocado.png',
        title: 'Avocado Dish',
        calories: '457 kcal',
        cookTime: '6 min',
        ingredients: ['Avocado', 'Spices'],
        fat: '1.5 g',
        protein: '10.9 g',
        carbs: '13.5 g',
        top: 493,
      ),
      Meal(
        imagePath: 'assets/Images/sNAKS 1.png',
        title: 'Healthy Snacks',
        calories: '230 kcal',
        cookTime: '7 min',
        ingredients: ['apple', 'Strawberry', 'Green Peas', 'banana', 'nuts'],
        fat: '1.5 g',
        protein: '10.9 g',
        carbs: '13.5 g',
        top: 597,
      ),
      Meal(
        imagePath: 'assets/Images/Curry Salmon 3.png',
        title: 'Curry salmon',
        calories: '176 kcal',
        cookTime: '7 min',
        ingredients: ['Salmon', 'Curry', 'Spices'],
        fat: '1.5 g',
        protein: '10.9 g',
        carbs: '13.5 g',
        top: 701,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final meals = getMeals();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
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
              Text('Meal plans', style: Styles.textStyle18),
              const SizedBox(
                height: 20,
              ),
              ...meals.map((meal) {
                return Column(
                  children: [
                    FoodCard(
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
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
