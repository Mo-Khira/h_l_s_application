import 'package:flutter/material.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_form_text_field.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_login_button.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_password_form_text_field.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_phone_number_text_filed.dart';

class LoginTextFields extends StatelessWidget {
  const LoginTextFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomFormTextField(
          labelText: "Email Address",
        ),
        const SizedBox(
          height: 24,
        ),
        CustomPhoneNumberTextField(),
        const SizedBox(
          height: 24,
        ),
        CustomPasswordFormTextField(
          text: "Password",
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
              onPressed: () {},
              child: Text(
                "Forget Password?",
                style: Styles.textStyle14.copyWith(color: kSecondaryColor),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        CustomLoginButton(
          text: 'Login',
          onPressed: () {},
        ),
      ],
    );
  }
}
