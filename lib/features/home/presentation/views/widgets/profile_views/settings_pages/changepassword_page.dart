import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_login_button.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_password_form_text_field.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                      "Change Password",
                      style: Styles.textStyle20
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 32,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 70,
                ),
                Text("Current Password",
                    style: Styles.textStyle16.copyWith(color: kSecondaryColor)),
                const SizedBox(
                  height: 9,
                ),
                CustomPasswordFormTextField(
                  text: '',
                ),
                const SizedBox(height: 15),
                const SizedBox(
                  height: 70,
                ),
                Text("New Password",
                    style: Styles.textStyle16.copyWith(color: kSecondaryColor)),
                const SizedBox(
                  height: 9,
                ),
                CustomPasswordFormTextField(
                  text: '',
                ),
                const SizedBox(height: 15),
                const SizedBox(
                  height: 30,
                ),
                Text("Confirm New Password",
                    style: Styles.textStyle16.copyWith(color: kSecondaryColor)),
                const SizedBox(
                  height: 9,
                ),
                CustomPasswordFormTextField(
                  text: '',
                ),
                SizedBox(
                  height: kHeight(context) * 0.2,
                ),
                CustomLoginButton(text: "Change Password")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
