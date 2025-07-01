import 'package:flutter/material.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:h_l_s_application/features/home/presentation/views/Home_view/widgets/circular_progress.dart';

class PlanPercent extends StatefulWidget {
  const PlanPercent({super.key});

  @override
  State<PlanPercent> createState() => _PlanPercentState();
}

class _PlanPercentState extends State<PlanPercent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 157,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color.fromARGB(255, 255, 255, 255),
      ),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                "My Plan",
                style: Styles.textStyle16.copyWith(
                  color: Colors.black,
                ),
              ),
              Text(
                "For Today",
                style: Styles.textStyle16.copyWith(
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 70,
          ),
          const CustomCircularProgress()
        ],
      ),
    );
  }
}
