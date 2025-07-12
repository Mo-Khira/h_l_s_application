import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/services/auth_repo.dart';
import 'package:h_l_s_application/core/utils/app_router.dart';
import 'package:h_l_s_application/core/utils/assets.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:h_l_s_application/features/auth/data/signup_fun.dart';
import 'package:h_l_s_application/features/auth/data/signup_state.dart';
import 'package:h_l_s_application/features/auth/presentation/views/layouts/custom_login_decoration_row.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_login_button.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_password_form_text_field.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_form_text_field.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_phone_number_text_filed.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/show_snack_bar.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupPage extends StatefulWidget {
  SignupPage({
    super.key,
    // this.email,
    // this.password,
  });

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  String? email;
  String? password;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isPhoneValid = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(AuthRepo()),
      child: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state is SignupSuccess) {
            GoRouter.of(context).pushReplacement(AppRouter.kLoginPage);
          } else if (state is SignupFailure) {
            showSnackBar(context, state.errorMessage);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            color: kPrimaryColor,
            progressIndicator: const CircularProgressIndicator(
              color: kSecondaryColor,
            ),
            inAsyncCall: state is SignupLoading,
            child: Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 24),
                          SizedBox(
                            height: 104,
                            child: Image.asset(AssetsData.logo),
                          ),
                          const SizedBox(height: 24),
                          CustomFormTextField(
                            labelText: "First Name",
                            formTextFieldController: firstNameController,
                          ),
                          const SizedBox(height: 24),
                          CustomFormTextField(
                            labelText: "Last Name",
                            formTextFieldController: lastNameController,
                          ),
                          const SizedBox(height: 24),
                          CustomFormTextField(
                            labelText: "Email Address",
                            keyboardType: TextInputType.emailAddress,
                            formTextFieldController: emailController,
                          ),
                          const SizedBox(height: 24),
                          CustomPhoneNumberTextField(
                            controller: phoneNumberController,
                            onValidityChanged: (isValid) {
                              setState(() {
                                isPhoneValid = isValid;
                              });
                            },
                          ),
                          const SizedBox(height: 24),
                          CustomPasswordFormTextField(
                            text: "Password",
                            formTextFieldController: passwordController,
                          ),
                          const SizedBox(height: 24),
                          CustomPasswordFormTextField(
                            text: "Confirm Password",
                            formTextFieldController: confirmPasswordController,
                          ),
                          const SizedBox(height: 40),
                          CustomLoginButton(
                            // onPressed: () async {
                            //   if (formKey.currentState!.validate()) {
                            //     setState(() => isLoading = true);
                            //     await Future.delayed(
                            //         const Duration(seconds: 4));
                            //     setState(() => isLoading = false);

                            //     GoRouter.of(context)
                            //         .pushReplacement(AppRouter.kSignupDonePage);
                            //   }
                            // },
                            onPressed: () async {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (_) => const Center(
                                  child: CircularProgressIndicator(
                                    color: kSecondaryColor,
                                  ),
                                ),
                              );

                              await Future.delayed(const Duration(seconds: 3));

                              if (context.mounted) {
                                GoRouter.of(context)
                                    .pushReplacement(AppRouter.kSignupDonePage);
                              }
                            },
                            text: "Sign up",
                          ),
                          const SizedBox(height: 60),
                          const CustomLoginDecorationRow(
                            text: 'Or Register With',
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {

                                },
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
                          const SizedBox(height: 64),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("I have an account",
                                  style: Styles.textStyle16),
                              TextButton(
                                onPressed: () {
                                  GoRouter.of(context)
                                      .pushReplacement(AppRouter.kLoginPage);
                                },
                                child: Text("Login",
                                    style: Styles.textStyle16
                                        .copyWith(color: kSecondaryColor)),
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
        },
      ),
    );
  }
}


// onPressed: () async {
                            //   if (formKey.currentState!.validate()) {
                            //     if (passwordController.text !=
                            //         confirmPasswordController.text) {
                            //       showSnackBar(
                            //           context, "Passwords don't match");
                            //       return;
                            //     }
                            //     if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            //         .hasMatch(emailController.text)) {
                            //       showSnackBar(
                            //           context, "Please enter a valid email");
                            //       return;
                            //     }
                            //     if (passwordController.text.length < 8) {
                            //       showSnackBar(context,
                            //           "Password must be at least 8 characters");
                            //       return;
                            //     }
                            //     await BlocProvider.of<SignupCubit>(context)
                            //         .signupUser(
                            //       firstName: firstNameController.text,
                            //       lastName: lastNameController.text,
                            //       email: emailController.text,
                            //       password: passwordController.text,
                            //       phoneNumber: phoneNumberController.text,
                            //     );
                            //   }
                            // },
