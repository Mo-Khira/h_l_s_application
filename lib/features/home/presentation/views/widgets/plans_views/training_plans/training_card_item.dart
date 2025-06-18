// training_card_item.dart

import 'package:flutter/material.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/styles.dart';

class TrainingCardItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final VoidCallback onTap;

  const TrainingCardItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: kHeight(context) * 0.1,
        margin: const EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(imagePath, width: 50, height: 50),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title,
                    style: Styles.textStyle16.copyWith(color: kPrimaryColor)),
                const SizedBox(height: 5),
                Text(subtitle,
                    style: Styles.textStyle14.copyWith(color: kPrimaryColor)),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: kPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
