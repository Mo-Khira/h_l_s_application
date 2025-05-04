import 'package:flutter/material.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/plans_views/food_plans/meal_details.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/plans_views/food_plans/meals_details.dart';
import '../widgets/meals_plans/food_card.dart';

class Mealplans extends StatelessWidget {
  const Mealplans({super.key});

  double getHeight(BuildContext context, double inputHeight) {
    return (inputHeight / 844.0) * MediaQuery.of(context).size.height;
  }

  double getWidth(BuildContext context, double inputWidth) {
    return (inputWidth / 390.0) * MediaQuery.of(context).size.width;
  }

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
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xff161515),
          borderRadius: BorderRadius.circular(40),
        ),
        child: SingleChildScrollView(
          child: SizedBox(
            height: getHeight(context, 900),
            child: Stack(
              children: [
                Positioned(
                  left: getWidth(context, 30),
                  top: getHeight(context, 72),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset(
                      'assets/Images/arrow_left_alt.png',
                      width: getWidth(context, 32),
                      height: getHeight(context, 32),
                    ),
                  ),
                ),
                Positioned(
                  left: getWidth(context, 23),
                  top: getHeight(context, 132),
                  child: const Text(
                    'Meal plans',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Poppins-SemiBold',
                    ),
                  ),
                ),
                ...meals.map((meal) {
                  return FoodCard(
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
      ),
    );
  }
}
