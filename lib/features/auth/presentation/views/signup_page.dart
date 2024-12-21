import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/app_router.dart';
import 'package:h_l_s_application/core/utils/assets.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:h_l_s_application/features/auth/presentation/views/layouts/custom_login_decoration_row.dart';
import 'package:h_l_s_application/features/auth/presentation/views/layouts/login_text_fields.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_login_button.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_password_text_field.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupPage extends StatefulWidget {
  SignupPage({super.key, this.email, this.password});

  String? email;
  String? password;

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    // CustomTextField(labelText: "First Name"),
                    const SizedBox(
                      height: 24,
                    ),
                    // CustomTextField(labelText: "Last Name"),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomTextField(
                        labelText: "Email Address",
                        onChanged: (data) {
                          widget.email = data;
                        }),
                    const SizedBox(
                      height: 24,
                    ),
                    // CustomTextField(labelText: "Phone Number"),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomPasswordTextField(
                      text: "Password",
                      onChanged: (data) {
                        widget.password = data;
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    // CustomPasswordTextField(text: "Confirm Password"),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomLoginButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          isLoading = true;
                          setState(() {});
                          try {
                            await registerUser();
                            showSnackBar(context, "success");
                          } on FirebaseAuthException catch (e) {
                            if (e.code == "weak-password") {
                              showSnackBar(context, "weak password");
                            } else if (e.code == "email-already-in-use") {
                              showSnackBar(context, "Email already exist");
                            }
                          } catch (e) {
                            showSnackBar(context, "there was an error");
                          }
                          isLoading = false;
                          setState(() {});
                        } else {}
                      },
                      text: "Sign up",
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    const CustomLoginDecorationRow(
                      text: 'Or SignUp With',
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
                    // const Spacer(
                    //   flex: 2,
                    // ),
                    const SizedBox(
                      height: 64,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "I have an account",
                          style: Styles.textStyle16,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(0)),
                          onPressed: () {
                            GoRouter.of(context)
                                .pushReplacement(AppRouter.kLoginPage);
                          },
                          child: Text(
                            "Login",
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
          ),
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Future<void> registerUser() async {
    UserCredential user =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: widget.email!,
      password: widget.password!,
    );
  }
}
