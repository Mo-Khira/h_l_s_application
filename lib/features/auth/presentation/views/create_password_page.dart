// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/app_router.dart';
import 'package:h_l_s_application/core/utils/assets.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_login_button.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_password_form_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CreatePasswordPage extends StatefulWidget {
  @override
  _CreatePasswordPage createState() => _CreatePasswordPage();
}

class _CreatePasswordPage extends State<CreatePasswordPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool isLoading = false;

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.yellowAccent),
    );
  }

  void handleConfirm() async {
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (password.length < 8) {
      showSnackBar(context, 'Password must be at least 8 characters');
      return;
    }

    if (password != confirmPassword) {
      showSnackBar(context, 'Passwords do not match');
      return;
    }

    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(milliseconds: 125));

    setState(() {
      isLoading = false;
    });

    GoRouter.of(context).pushReplacement(AppRouter.kPasswordChangedPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: isLoading,
          progressIndicator: const CircularProgressIndicator(
            color: kSecondaryColor,
          ),
          color: kPrimaryColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      Center(
                        child: SizedBox(
                          height: 164,
                          child: Image.asset(AssetsData.createPasswordImage),
                        ),
                      ),
                      const SizedBox(
                        width: 32,
                      )
                    ],
                  ),
                  const SizedBox(height: 56),
                  Text('Create Password', style: Styles.textStyle24),
                  const SizedBox(height: 8),
                  Text('The password should have at least\n6 characters',
                      style: Styles.textStyle16),
                  const SizedBox(height: 55),
                  CustomPasswordFormTextField(
                    text: "new password",
                    formTextFieldController: _passwordController,
                  ),
                  const SizedBox(height: 32),
                  CustomPasswordFormTextField(
                    text: "Confirm new password",
                    formTextFieldController: _confirmPasswordController,
                  ),
                  const SizedBox(height: 53),
                  Center(
                    child: CustomLoginButton(
                      text: "Confirm",
                      onPressed: handleConfirm,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
