import 'package:flutter/material.dart';

class TrainingCard extends StatelessWidget {
  final String title;
  final String exercises;
  final String duration;
  final String image;
  final VoidCallback onTap;

  const TrainingCard({
    Key? key,
    required this.title,
    required this.exercises,
    required this.duration,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // ✅ Clickable
      child: Container(
        width: 382, // ✅ Fixed width
        height: 75, // ✅ Fixed height
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16), // ✅ Border Radius
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(image, width: 64, height: 30),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xff161515),
                        fontFamily: 'Poppins-Medium',
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          exercises,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xff161515),
                            fontFamily: 'Poppins-Regular',
                          ),
                        ),
                        const SizedBox(width: 4),
                        Image.asset('assets/Images/Ellipse 4.png',
                            width: 4, height: 4),
                        const SizedBox(width: 8),
                        Text(
                          duration,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xff161515),
                            fontFamily: 'Poppins-Regular',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Image.asset('assets/Images/Down.png',
                width: 24, height: 24), // Expand icon
          ],
        ),
      ),
    );
  }
}

class TrainingCardList extends StatelessWidget {
  const TrainingCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> trainingData = [
      {
        "title": "Full Body Warm Up",
        "exercises": "20 Exercises",
        "duration": "20 min",
        "image": "assets/Images/Vector 01.png"
      },
      {
        "title": "Both Side Plank",
        "exercises": "18 Exercises",
        "duration": "14 min",
        "image": "assets/Images/Vector 03.png"
      },
      {
        "title": "Abs Workout",
        "exercises": "18 Exercises",
        "duration": "30 min",
        "image": "assets/Images/Vector 04.png"
      },
    ];

    return SizedBox(
      height: 250, // ✅ Allows scrolling
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical, // ✅ Scrollable
        itemCount: trainingData.length,
        itemBuilder: (context, index) {
          final training = trainingData[index];
          return TrainingCard(
            title: training["title"]!,
            exercises: training["exercises"]!,
            duration: training["duration"]!,
            image: training["image"]!,
            onTap: () {
              print('${training["title"]} clicked!');
            },
          );
        },
      ),
    );
  }
}
