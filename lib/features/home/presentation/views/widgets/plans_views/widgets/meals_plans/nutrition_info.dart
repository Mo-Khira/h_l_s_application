import 'package:flutter/material.dart';

class NutritionInfo extends StatelessWidget {
  final String fat;
  final String protein;
  final String carbs;

  const NutritionInfo({
    super.key,
    required this.fat,
    required this.protein,
    required this.carbs,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 50,
      top: 432,
      child: NutritionBox(fat: fat, protein: protein, carbs: carbs),
    );
  }
}

class NutritionBox extends StatelessWidget {
  final String fat;
  final String protein;
  final String carbs;

  const NutritionBox({
    super.key,
    required this.fat,
    required this.protein,
    required this.carbs,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final boxWidth = 328.0;
    final scaleFactor = screenWidth < boxWidth ? screenWidth / boxWidth : 1.0;

    return Transform.scale(
      scale: scaleFactor,
      alignment: Alignment.topLeft,
      child: Container(
        width: 328,
        height: 74,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9),
        ),
        padding: const EdgeInsets.only(left: 34, top: 7),
        child: Row(
          children: [
            _InfoItem(label: 'Fat', value: fat),
            const SizedBox(width: 55),
            _InfoItem(label: 'Protein', value: protein),
            const SizedBox(width: 55),
            _InfoItem(label: 'Carbs', value: carbs),
          ],
        ),
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final String label;
  final String value;

  const _InfoItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 59,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 18,
              color: Color(0xff161515),
              fontFamily: 'Poppins-Medium',
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xff161515),
              fontFamily: 'Poppins-Medium',
            ),
          ),
        ],
      ),
    );
  }
}
