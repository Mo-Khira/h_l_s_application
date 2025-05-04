import 'package:flutter/material.dart';

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

  double getWidth(BuildContext context, double inputWidth) {
    return (inputWidth / 390.0) * MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: getWidth(context, 24),
      top: getHeight(context, top),
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: getWidth(context, 342),
          height: getHeight(context, 77),
          child: Stack(
            children: [
              Container(
                width: getWidth(context, 382),
                height: getHeight(context, 75),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  width: getWidth(context, 120),
                  height: getHeight(context, 77),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: getWidth(context, 130),
                top: getHeight(context, 18),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff161515),
                    fontFamily: 'Poppins-SemiBold',
                  ),
                ),
              ),
              Positioned(
                left: getWidth(context, 130),
                top: getHeight(context, 44),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/Images/fire.png',
                      width: getWidth(context, 10),
                      height: getHeight(context, 12),
                    ),
                    const SizedBox(width: 5),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
