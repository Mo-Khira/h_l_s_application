import 'package:flutter/material.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/styles.dart';

class FoodCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String calories;
  final double top;
  final VoidCallback onTap;

  const FoodCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.calories,
    required this.top,
    required this.onTap,
  });

  double getHeight(BuildContext context, double inputHeight) {
    return (inputHeight / 844.0) * MediaQuery.of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      // left: kWidth(context) * 0.5,
      top: getHeight(context, top),
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: kWidth(context),
          height: kHeight(context) * 0.1,
          child: Stack(
            children: [
              Container(
                width: kWidth(context),
                height: kHeight(context) * 0.1,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  width: kWidth(context) * 0.3,
                  height: kHeight(context) * 0.1,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: kWidth(context) * 0.34,
                top: getHeight(context, 18),
                child: Text(title,
                    style: Styles.textStyle12.copyWith(
                        color: kPrimaryColor, fontWeight: FontWeight.bold)),
              ),
              Positioned(
                left: kWidth(context) * 0.34,
                top: getHeight(context, 44),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/Images/fire.png',
                      width: kWidth(context) * 0.05,
                      height: kWidth(context) * 0.05,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      calories,
                      style: Styles.textStyle12.copyWith(color: kPrimaryColor),
                    )
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
