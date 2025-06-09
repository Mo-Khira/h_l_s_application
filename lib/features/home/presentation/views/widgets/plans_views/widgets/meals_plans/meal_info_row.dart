import 'package:flutter/material.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/styles.dart';

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
      // left: 85,
      top: kHeight(context) * 0.4,
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
    return SizedBox(
      width: kWidth(context),
      height: 25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Spacer(),
          const ImageIcon(
            AssetImage('assets/Images/calories.png'),
            size: 25,
            color: Colors.white,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            calories, // 👈 dynamic calories
            style: Styles.textStyle16,
          ),
          const Spacer(),
          Container(
            color: Colors.white,
            height: 20,
            width: 1,
          ),
          const Spacer(),
          const ImageIcon(
            AssetImage('assets/Images/clock.png'),
            size: 24,
            color: Colors.white,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            cookTime,
            style: Styles.textStyle16,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
