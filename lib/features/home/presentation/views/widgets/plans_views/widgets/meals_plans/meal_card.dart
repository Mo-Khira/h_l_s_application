import 'package:flutter/material.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/plans_views/food_plans/meals_details.dart';

class MealCard extends StatelessWidget {
  final String image;
  final String title;
  final String calories;
  final List<String> ingredients;
  final String cookTime;
  final String fat;
  final String protein;
  final String carbs;

  const MealCard({
    Key? key,
    required this.image,
    required this.title,
    required this.calories,
    required this.ingredients,
    required this.cookTime,
    required this.fat,
    required this.protein,
    required this.carbs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MealsDetails(
              imagePath: image,
              ingredients: ingredients,
              calories: calories,
              cookTime: cookTime,
              fat: fat,
              protein: protein,
              carbs: carbs,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              // Meal Image
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                child: Image.asset(
                  image,
                  width: 120,
                  height: 77,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),

              // Meal Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xff161515),
                        fontFamily: 'Poppins-SemiBold',
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Image.asset(
                          'assets/Images/fire.png',
                          width: 8.679,
                          height: 10.945,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          calories,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xff161515),
                            fontFamily: 'Poppins-Regular',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
