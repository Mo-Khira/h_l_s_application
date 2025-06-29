import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/app_router.dart';
import 'package:h_l_s_application/core/utils/assets.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:h_l_s_application/features/auth/data/login_cubit.dart';
import 'package:h_l_s_application/features/auth/data/login_state.dart';
import 'package:h_l_s_application/features/auth/presentation/views/layouts/custom_login_decoration_row.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_login_button.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_password_form_text_field.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_form_text_field.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/show_snack_bar.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  LoginPage({super.key, this.email, this.password});

  String? email;
  String? password;

  @override
  State<LoginPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<LoginPage> {
  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: ModalProgressHUD(
        color: kPrimaryColor,
        progressIndicator: const CircularProgressIndicator(
          color: kSecondaryColor,
        ),
        inAsyncCall: isLoading,
        child: SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      SizedBox(
                        height: 104,
                        child: Image.asset(AssetsData.logo),
                      ),
                      const SizedBox(
                        height: 64,
                      ),
                      CustomFormTextField(
                          labelText: "Email Address",
                          onChanged: (data) {
                            widget.email = data;
                          }),
                      const SizedBox(
                        height: 24,
                      ),
                      CustomPasswordFormTextField(
                        text: "Password",
                        onChanged: (data) {
                          widget.password = data;
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(0)),
                            onPressed: () {
                              GoRouter.of(context)
                                  .push(AppRouter.kResetPasswordPage);
                            },
                            child: Text(
                              "Forget Password?",
                              style: Styles.textStyle14
                                  .copyWith(color: kSecondaryColor),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BlocConsumer<LoginCubit, LoginState>(
                        listener: (context, state) {
                          if (state is LoginLoading) {
                            setState(() {
                              isLoading = true;
                            });
                          } else if (state is LoginSuccess) {
                            setState(() {
                              isLoading = false;
                            });
                            GoRouter.of(context)
                                .push(AppRouter.kUserInfoInputs);
                          } else if (state is LoginFailure) {
                            setState(() {
                              isLoading = false;
                            });
                            showSnackBar(context, state.errorMessage);
                          }
                        },
                        builder: (context, state) {
                          return CustomLoginButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                BlocProvider.of<LoginCubit>(context).userLogin(
                                  email: widget.email!,
                                  password: widget.password!,
                                );
                              }
                            },
                            text: "Login",
                          );
                        },
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      const CustomLoginDecorationRow(
                        text: 'Or Login With',
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
                      const SizedBox(
                        height: 64,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: Styles.textStyle16,
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(0)),
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
            ),
          ),
        ),
      ),
    );
  }
}
