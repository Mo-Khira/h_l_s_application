import 'package:flutter/material.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/styles.dart';

class MealCardItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String calories;
  final double top;
  final VoidCallback onTap;

  const MealCardItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.calories,
    required this.top,
    required this.onTap,
  });

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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                imagePath,
                width: kWidth(context) * 0.3,
                height: kHeight(context) * 0.1,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle16.copyWith(
                      overflow: TextOverflow.clip,
                      color: kPrimaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/Images/fire.png',
                        width: kWidth(context) * 0.05,
                        height: kWidth(context) * 0.05,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        calories,
                        style:
                            Styles.textStyle14.copyWith(color: kPrimaryColor),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
