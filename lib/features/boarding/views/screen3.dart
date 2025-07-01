import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/app_router.dart';
import 'package:h_l_s_application/core/utils/assets.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:h_l_s_application/features/boarding/views/widgets/begin_screen_bar.dart';

class ScreenThree extends StatelessWidget {
  const ScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onHorizontalDragEnd: (details) {
            if (details.primaryVelocity! < 1) {
              GoRouter.of(context).pop();
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: kWidth(context),
                child: Image.asset(AssetsData.screen3),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Stay fit , Stay strong ,\n Stay you \n',
                textAlign: TextAlign.center,
                style: Styles.textStyle24,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BeginScreenBar(widthKey: 0, colorKey: 0),
                  BeginScreenBar(widthKey: 0, colorKey: 0),
                  BeginScreenBar(widthKey: 1, colorKey: 1),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: MaterialButton(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: screenWidth,
                      decoration: BoxDecoration(
                          color: kSecondaryColor,
                          borderRadius: BorderRadius.circular(16)),
                      child: Text(
                        "Start now",
                        style: Styles.textStyle24.copyWith(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  onPressed: () {
                    GoRouter.of(context).pushReplacement(AppRouter.kLoginPage);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
