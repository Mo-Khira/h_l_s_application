import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/app_router.dart';
import 'package:h_l_s_application/core/utils/assets.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_login_button.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_phone_number_text_filed.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_count_down_timer.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyCodePage extends StatefulWidget {
  @override
  _VerifyCodePage createState() => _VerifyCodePage();
}

class _VerifyCodePage extends State<VerifyCodePage> {
  final TextEditingController _phoneController = TextEditingController();
  bool _isFieldFocused = false;
  String num = "**********";

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
                        child: Image.asset(AssetsData.verifyCodeImage),
                      ),
                    ),
                    const SizedBox(
                      width: 32,
                    )
                  ],
                ),
                const SizedBox(height: 56),
                Text('Verify Code ', style: Styles.textStyle24),
                const SizedBox(height: 8),
                Text(
                    'We Just sent a 4-digit verification code to\n ${num} Enter the code in the box below to\n continue',
                    style: Styles.textStyle14),
                const SizedBox(
                  height: 44,
                ),
                TextButton(
                  style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
                  onPressed: () {
                    GoRouter.of(context)
                        .pushReplacement(AppRouter.kResetPasswordPage);
                  },
                  child: Text(
                    "Edit the number",
                    style: Styles.textStyle14.copyWith(
                      color: kSecondaryColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                PinCodeTextField(
                  appContext: context,
                  length: 4,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10),
                    borderWidth: 1,
                    fieldHeight: 60,
                    fieldWidth: 60,
                    activeFillColor: Colors.white,
                    selectedFillColor: Colors.grey.shade200,
                    inactiveFillColor: Colors.grey.shade100,
                    inactiveColor: Colors.grey,
                    activeColor: kSecondaryColor,
                    selectedColor: kSecondaryColor,
                  ),
                ),

                const SizedBox(
                  height: 21,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Don't recieve a code ?",
                      style: Styles.textStyle14,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(0)),
                      onPressed: () {},
                      child: Text(
                        "Resend",
                        style: Styles.textStyle14.copyWith(
                          color: kSecondaryColor,
                        ),
                      ),
                    ),
                    const Spacer(),
                    const CustomCountdownTimer(),
                    // const Text("0:00"),
                  ],
                ),
                const SizedBox(
                    height: 50), // Increased height to move the button lower
                Center(
                  child: CustomLoginButton(
                    text: "Send",
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.kCreatePasswordPage);
                    },
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
