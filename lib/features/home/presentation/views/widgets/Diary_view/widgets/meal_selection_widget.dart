import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/styles.dart';

class MealSelectionWidget extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback? onTap;

  const MealSelectionWidget({
    super.key,
    required this.title,
    required this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: kWidth(context),
                height: kHeight(context) * 0.09,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black..withValues(alpha: 0.15),
                      BlendMode.darken,
                    ),
                  ),
                ),
              ),
              Container(
                // width: kWidth(context) * 0.9,
                height: kHeight(context) * 0.09,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.8),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title,
                        style:
                            Styles.textStyle18.copyWith(color: kPrimaryColor)),
                    Container(
                      width: kWidth(context) * 0.08,
                      height: kWidth(context) * 0.08,
                      decoration: const BoxDecoration(
                        color: kSecondaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.add,
                        color: kPrimaryColor,
                        size: kWidth(context) * 0.05,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: kHeight(context) * 0.01),
      ],
    );
  }
}
