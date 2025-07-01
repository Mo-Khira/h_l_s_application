import 'package:flutter/material.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/styles.dart';

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: kWidth(context) * 0.8,
          height: 74,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _InfoItem(label: 'Fat', value: fat),
              _InfoItem(label: 'Protein', value: protein),
              _InfoItem(label: 'Carbs', value: carbs),
            ],
          ),
        ),
      ],
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
      height: 59,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: Styles.textStyle18.copyWith(color: kPrimaryColor),
          ),
          Text(
            value,
            style: Styles.textStyle14.copyWith(color: kPrimaryColor),
          ),
        ],
      ),
    );
  }
}
