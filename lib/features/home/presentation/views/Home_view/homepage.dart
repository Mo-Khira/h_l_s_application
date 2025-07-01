import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/app_router.dart';
import 'package:h_l_s_application/features/home/presentation/views/Home_view/widgets/custom_search_bar.dart';
import 'package:h_l_s_application/features/home/presentation/views/Home_view/widgets/plan_percent.dart';
import 'package:h_l_s_application/features/home/presentation/views/Home_view/widgets/stats.dart';

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
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                SizedBox(height: kHeight(context) * 0.1),
                CustomSearchBar(
                  readOnly: true,
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kSearchScreen);
                  },
                ),
                SizedBox(
                  height: kHeight(context) * 0.04,
                ),
                const PlanPercent(),
                SizedBox(
                  height: kHeight(context) * 0.04,
                ),
                const StatsGrid()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
