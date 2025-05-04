import 'package:flutter/material.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/Home_view/widgets/circular_progress.dart';

class PlanPercent extends StatefulWidget {
  const PlanPercent({super.key});

  @override
  State<PlanPercent> createState() => _PlanPercentState();
}

class _PlanPercentState extends State<PlanPercent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: 157,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                "My Plan",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              Text(
                "For Today",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 70,
          ),
          CustomCircularProgress()
        ],
      ),
    );
  }
}
