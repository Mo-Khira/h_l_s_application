import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/app_router.dart';
import 'package:h_l_s_application/core/utils/assets.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:h_l_s_application/features/auth/presentation/views/layouts/custom_login_decoration_row.dart';
import 'package:h_l_s_application/features/auth/presentation/views/layouts/login_text_fields.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Expanded(
                flex: 4,
                child: SizedBox(),
              ),
              const LoginTextFields(),
              const Expanded(
                flex: 2,
                child: SizedBox(
                  height: 64,
                ),
              ),
              const CustomLoginDecorationRow(
                text: 'Or LogIn With',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.apple_sharp,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.facebook,
                      color: Colors.blue,
                      size: 30,
                    ),
                  ),
                  MaterialButton(
                    minWidth: 0,
                    padding: const EdgeInsets.all(0),
                    onPressed: () {},
                    child: Image.asset(
                      AssetsData.googleIcon,
                      height: 30,
                      width: 30,
                    ),
                  ),
                ],
              ),
              const Expanded(
                flex: 2,
                child: SizedBox(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: Styles.textStyle16,
                  ),
                  TextButton(
                    style:
                        TextButton.styleFrom(padding: const EdgeInsets.all(0)),
                    onPressed: () {
                      GoRouter.of(context)
                          .pushReplacement(AppRouter.kSignupPage);
                    },
                    child: Text(
                      "Sign up",
                      style: Styles.textStyle16.copyWith(
                        color: kSecondaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
