import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/app_router.dart';
import 'package:h_l_s_application/core/utils/assets.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:h_l_s_application/features/boarding/views/widgets/begin_screen_bar.dart';
import 'package:h_l_s_application/features/boarding/views/widgets/begin_screen_image.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const BeginScreenImage(
              selectedImage: AssetsData.screen2,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Find nutrition tips that \n fit your lifestyle \n',
              textAlign: TextAlign.center,
              style: Styles.textStyle24,
            ),
            // const BeginScreenBar(widthKey: 2, colorKey: 2)
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BeginScreenBar(widthKey: 0, colorKey: 0),
                BeginScreenBar(widthKey: 1, colorKey: 1),
                BeginScreenBar(widthKey: 0, colorKey: 0),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    child: Text(
                      "Skip",
                      style: Styles.textStyle20,
                    ),
                    onPressed: () {
                      GoRouter.of(context)
                          .pushReplacement(AppRouter.kLoginPage);
                    },
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: kSecondaryColor,
                        borderRadius: BorderRadius.circular(30)),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: kPrimaryColor,
                      ),
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.kScreenThree);
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
