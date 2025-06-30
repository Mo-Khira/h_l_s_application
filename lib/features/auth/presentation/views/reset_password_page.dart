import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:h_l_s_application/core/utils/app_router.dart';
import 'package:h_l_s_application/core/utils/assets.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_login_button.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_phone_number_text_filed.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/show_snack_bar.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  ResetPasswordScreenState createState() => ResetPasswordScreenState();
}

class ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final bool isFieldFocused = false;

  bool isPhoneValid = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
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
                        child: Image.asset(AssetsData.passwordImage),
                      ),
                    ),
                    const SizedBox(
                      width: 32,
                    )
                  ],
                ),
                const SizedBox(height: 56),
                Text('Reset Password', style: Styles.textStyle24),
                const SizedBox(height: 8),
                Text(
                    'Please enter your phone number below to\nrecover your password',
                    style: Styles.textStyle16),
                const SizedBox(height: 55),
                CustomPhoneNumberTextField(
                  controller: _phoneController,
                  onValidityChanged: (isValid) {
                    setState(() {
                      isPhoneValid = isValid;
                    });
                  },
                ),
                const SizedBox(height: 100),
                Center(
                  child: CustomLoginButton(
                    text: "Send",
                    onPressed: () {
                      if (!isPhoneValid || _phoneController.text.isEmpty) {
                        showSnackBar(
                            context, "Please enter a valid phone number.");
                        return;
                      }

                      GoRouter.of(context).push(
                        AppRouter.kVerityCodePage,
                        extra: _phoneController.text,
                      );
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
