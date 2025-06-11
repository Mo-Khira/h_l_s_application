import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/app_router.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_login_button.dart';

class TrainingCompletedScreen extends StatefulWidget {
  const TrainingCompletedScreen({super.key});

  @override
  State<TrainingCompletedScreen> createState() => _TrainingCompletedScreen();
}

class _TrainingCompletedScreen extends State<TrainingCompletedScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    padding: const EdgeInsetsDirectional.all(0),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 28,
                    ),
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                  ),
                  Text(
                    "Result ",
                    style: Styles.textStyle20
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(),
                ],
              ),
              const SizedBox(height: 60),
              Text(
                "Workout",
                style: Styles.textStyle16.copyWith(
                    color: kSecondaryColor, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                """Exercises with Full Body Warm Up\n \nCompleted on 17/08/2024\n \nExercise 3/12""",
                style: Styles.textStyle14,
              ),
              const SizedBox(
                height: 36,
              ),
              Text(
                "Workout summary",
                style: Styles.textStyle16.copyWith(
                    color: kSecondaryColor, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: kWidth(context) * 0.4,
                    height: kWidth(context) * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey[850],
                    ),
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Total time",
                          ),
                          Text("00:45 min"),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: kWidth(context) * 0.4,
                    height: kWidth(context) * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey[850],
                    ),
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Total time",
                          ),
                          Text("00:45 min"),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: kWidth(context) * 0.4,
                    height: kWidth(context) * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey[850],
                    ),
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Total time",
                          ),
                          Text("00:45 min"),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: kWidth(context) * 0.4,
                    height: kWidth(context) * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey[850],
                    ),
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Total time",
                          ),
                          Text("00:45 min"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Expanded(
                child: SizedBox(),
              ),
              CustomLoginButton(
                text: "Save",
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kHomeView);
                },
              ),
              const SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }
}
