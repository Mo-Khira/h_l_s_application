import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/Home_view/widgets/circular_progress_state.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/Home_view/widgets/heart_state.dart';

class Stats extends StatefulWidget {
  final String text;
  final String iconPath;
  final double endPoint;
  final String text1;
  final String text2;

  const Stats({
    super.key,
    required this.text,
    required this.iconPath,
    required this.endPoint,
    required this.text1,
    required this.text2,
  });

  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        height: 175,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(widget.iconPath),
                Text(
                  widget.text,
                  style: Styles.textStyle16.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            CustomCircularProgressState(
              endPoint: widget.endPoint,
              text1: widget.text1,
              text2: widget.text2,
            ),
          ],
        ),
      ),
    );
  }
}

class StatsGrid extends StatelessWidget {
  const StatsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 30,
          mainAxisSpacing: 30,
          childAspectRatio: 0.75,
        ),
        itemCount: statGridList.length,
        itemBuilder: (context, index) {
          return statGridList[index];
        },
      ),
    );
  }
}

// Define the stats grid items
List<dynamic> statGridList = [
  const Stats(
    text: "Calories",
    iconPath: "assets/svgs/fire.svg",
    endPoint: 0.6,
    text1: "399",
    text2: "Kcal",
  ),
  const HeartState(
    text: "Heart",
    iconPath: "assets/svgs/black_heart.svg",
  ),
  const Stats(
    text: "Walk",
    iconPath: "assets/svgs/shoe.svg",
    endPoint: 0.5,
    text1: "2265",
    text2: "Steps",
  ),
  const Stats(
    text: "Sleep",
    iconPath: "assets/svgs/moon.svg",
    endPoint: 0.3,
    text1: "8:50",
    text2: "Hours",
  ),
];
