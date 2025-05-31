import 'package:flutter/material.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/Home_view/widgets/custom_search_bar.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/Home_view/widgets/plan_percent.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/Home_view/widgets/stats.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: const Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 23),
            child: Column(
              children: [
                SizedBox(height: 102),
                CustomSearchBar(),
                SizedBox(
                  height: 43,
                ),
                PlanPercent(),
                SizedBox(
                  height: 32,
                ),
                StatsGrid()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
