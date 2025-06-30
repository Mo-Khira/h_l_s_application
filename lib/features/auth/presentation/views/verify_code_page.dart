// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/app_router.dart';
import 'package:h_l_s_application/core/utils/assets.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_login_button.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_count_down_timer.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyCodePage extends StatefulWidget {
  final String phoneNumber;

  const VerifyCodePage({super.key, required this.phoneNumber});

  @override
  _VerifyCodePage createState() => _VerifyCodePage();
}

class _VerifyCodePage extends State<VerifyCodePage> {
  late String maskedPhone;
  String enteredCode = '';
  bool isResendAvailable = false;

  @override
  void initState() {
    super.initState();
    final fullNumber = widget.phoneNumber;
    if (fullNumber.length >= 5) {
      final start = fullNumber.substring(0, 3);
      final end = fullNumber.substring(fullNumber.length - 2);
      maskedPhone = '$start******$end';
    } else {
      maskedPhone = fullNumber;
    }
  }

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
                    'We Just sent a 4-digit verification code to\n $maskedPhone Enter the code in the box below to\n continue',
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
                  onChanged: (value) {
                    setState(() {
                      enteredCode = value;
                    });
                  },
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
                      "Don't receive a code ?",
                      style: Styles.textStyle14,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(0)),
                      onPressed: isResendAvailable
                          ? () {
                              setState(() {
                                isResendAvailable = false;
                              });
                            }
                          : null,
                      child: Text(
                        "Resend",
                        style: Styles.textStyle14.copyWith(
                          color:
                              isResendAvailable ? kSecondaryColor : Colors.grey,
                        ),
                      ),
                    ),
                    const Spacer(),
                    CustomCountdownTimer(
                      onFinished: () {
                        setState(() {
                          isResendAvailable = true;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Center(
                  child: CustomLoginButton(
                    text: "Send",
                    onPressed: enteredCode.length == 4
                        ? () {
                            GoRouter.of(context)
                                .push(AppRouter.kCreatePasswordPage);
                          }
                        : null,
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
