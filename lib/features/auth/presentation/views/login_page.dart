import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/app_router.dart';
import 'package:h_l_s_application/core/utils/assets.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:h_l_s_application/features/auth/presentation/views/layouts/custom_login_decoration_row.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_login_button.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_password_form_text_field.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_form_text_field.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/show_snack_bar.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

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
                      height: 124,
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
                      height: 24,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomLoginButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          isLoading = true;
                          setState(() {});
                          try {
                            await loginUser();
                            showSnackBar(context, "success");
                          } on FirebaseAuthException catch (e) {
                            isLoading = false;
                            setState(() {});
                            if (e.code == "user-not-found") {
                              showSnackBar(context, "User not found");
                            } else if (e.code == "wrong-password") {
                              showSnackBar(context, "Wrong password");
                            }
                          } catch (e) {
                            isLoading = false;
                            setState(() {});
                            print(e);
                            showSnackBar(context, "there was an error");
                          }
                          isLoading = false;
                          setState(() {});
                        } else {}
                        GoRouter.of(context)
                            .pushReplacement(AppRouter.kHomeView);
                      },
                      text: "Login",
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
    );
  }

  Future<void> loginUser() async {
    UserCredential user =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: widget.email!,
      password: widget.password!,
    );
  }
}


/*
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:h_l_s_application/constants.dart';
// import 'package:h_l_s_application/core/utils/app_router.dart';
// import 'package:h_l_s_application/core/utils/assets.dart';
// import 'package:h_l_s_application/core/utils/styles.dart';
// import 'package:h_l_s_application/features/auth/presentation/views/layouts/custom_login_decoration_row.dart';
// import 'package:h_l_s_application/features/auth/presentation/views/layouts/login_text_fields.dart';

// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               const Expanded(
//                 flex: 4,
//                 child: SizedBox(),
//               ),
//               const LoginTextFields(),
//               const Expanded(
//                 flex: 2,
//                 child: SizedBox(
//                   height: 64,
//                 ),
//               ),
//               const CustomLoginDecorationRow(
//                 text: 'Or LogIn With',
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   IconButton(
//                     onPressed: () {},
//                     icon: const Icon(
//                       Icons.apple_sharp,
//                       color: Colors.white,
//                       size: 30,
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: () {},
//                     icon: const Icon(
//                       Icons.facebook,
//                       color: Colors.blue,
//                       size: 30,
//                     ),
//                   ),
//                   MaterialButton(
//                     minWidth: 0,
//                     padding: const EdgeInsets.all(0),
//                     onPressed: () {},
//                     child: Image.asset(
//                       AssetsData.googleIcon,
//                       height: 30,
//                       width: 30,
//                     ),
//                   ),
//                 ],
//               ),
//               const Expanded(
//                 flex: 2,
//                 child: SizedBox(),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Don't have an account? ",
//                     style: Styles.textStyle16,
//                   ),
//                   TextButton(
//                     style:
//                         TextButton.styleFrom(padding: const EdgeInsets.all(0)),
//                     onPressed: () {
//                       GoRouter.of(context)
//                           .pushReplacement(AppRouter.kSignupPage);
//                     },
//                     child: Text(
//                       "Sign up",
//                       style: Styles.textStyle16.copyWith(
//                         color: kSecondaryColor,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
*/