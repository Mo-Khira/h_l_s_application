import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/app_router.dart';
import 'package:h_l_s_application/core/utils/assets.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_login_button.dart';

class SignupDonePage extends StatelessWidget {
  const SignupDonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 54,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_sharp,
                        size: 32,
                      ),
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                    ),
                    const SizedBox(),
                  ],
                ),
                SizedBox(height: kHeight(context) * 0.2),
                Center(
                  child: SizedBox(
                    height: 100,
                    child: Image.asset(AssetsData.successMarkImage),
                  ),
                ),
                const SizedBox(height: 30),
                Text('Signup Done Successfully!', style: Styles.textStyle26),
                const SizedBox(height: 40),
                Center(
                  child: CustomLoginButton(
                    text: "Return to Login",
                    onPressed: () {
                      GoRouter.of(context)
                          .pushReplacement(AppRouter.kLoginPage);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
