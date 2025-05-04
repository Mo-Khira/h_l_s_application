import 'package:flutter/material.dart';

class MealInfoRow extends StatelessWidget {
  final String calories;
  final String cookTime;

  const MealInfoRow({
    super.key,
    required this.calories,
    required this.cookTime,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 85,
      top: 351,
      child: MealInfoContent(calories: calories, cookTime: cookTime),
    );
  }
}

class MealInfoContent extends StatelessWidget {
  final String calories;
  final String cookTime;

  const MealInfoContent({
    super.key,
    required this.calories,
    required this.cookTime,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final originalWidth = 255.437;
    final scaleFactor =
        screenWidth < originalWidth ? screenWidth / originalWidth : 1.0;

    return Transform.scale(
      scale: scaleFactor,
      alignment: Alignment.topLeft,
      child: SizedBox(
        width: 255.437,
        height: 25.001,
        child: Stack(
          children: [
            // Cooking Time
            Positioned(
              left: 173,
              width: 82.437,
              top: 0,
              height: 24.001,
              child: Stack(
                children: [
                  Positioned(
                    left: 36.437,
                    top: 0.001,
                    child: Text(
                      cookTime, // 👈 dynamic cooking time
                      style: const TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 16,
                        color: Color(0xffffffff),
                        fontFamily: 'Poppins-Medium',
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 0,
                    width: 24,
                    top: 0,
                    height: 24,
                    child: ImageIcon(
                      AssetImage('assets/Images/clock.png'),
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            // Calories
            Positioned(
              left: 0,
              width: 95.051,
              top: 0,
              height: 25.001,
              child: Stack(
                children: [
                  Positioned(
                    left: 32.051,
                    top: 1.001,
                    child: Text(
                      calories, // 👈 dynamic calories
                      style: const TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 16,
                        color: Color(0xffffffff),
                        fontFamily: 'Poppins-Medium',
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 0,
                    width: 21.875,
                    top: 0,
                    height: 25,
                    child: ImageIcon(
                      AssetImage('assets/Images/calories.png'),
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            // Divider Line
            const Positioned(
              left: 136,
              width: 1,
              top: 5,
              height: 16,
              child: Image(
                image: AssetImage('assets/Images/Line 2.png'),
                width: 1,
                height: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
