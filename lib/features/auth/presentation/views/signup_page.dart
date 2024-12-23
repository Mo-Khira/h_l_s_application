import 'package:cloud_firestore/cloud_firestore.dart';
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
                    CustomFormTextField(
                      labelText: "First Name",
                      formTextFieldController: firstNameController,
                      // onChanged: (data) {
                      //   firstNameController.text = data;
                      // },
                    ),
                    const SizedBox(height: 24),
                    CustomFormTextField(
                      labelText: "Last Name",
                      formTextFieldController: lastNameController,
                      // onChanged: (data) {
                      //   lastNameController.text = data;
                      // },
                    ),
                    const SizedBox(height: 24),
                    CustomFormTextField(
                      labelText: "Phone Number",
                      formTextFieldController: phoneNumberController,
                      keyboardType: TextInputType.phone,
                      // onChanged: (data) {
                      //   phoneNumberController.text = data;
                      // },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomFormTextField(
                      labelText: "Email Address",
                      keyboardType: TextInputType.emailAddress,
                      formTextFieldController: emailController,
                      // onChanged: (data) {
                      //   email = data;
                      // },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomPasswordFormTextField(
                      text: "Password",
                      formTextFieldController: passwordController,
                      // onChanged: (data) {
                      //   password = data;
                      // },
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
                          } finally {
                            isLoading = false;
                            setState(() {});
                          }
                        }
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

  Future<void> registerUser() async {
    FirebaseFirestore.instance.settings =
        const Settings(persistenceEnabled: true);

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      String userId = userCredential.user!.uid;

      await FirebaseFirestore.instance.collection('users').doc(userId).set({
        'firstName': firstNameController.text,
        'lastName': lastNameController.text,
        'phoneNumber': phoneNumberController.text,
        'email': emailController.text,
        // 'createdAt': FieldValue.serverTimestamp(),
      });

      print("*********************User registered and data saved to Firestore");
    } catch (e) {
      print("*******************Error during registration: $e");
      showSnackBar(context, "An error occurred: $e");
    }
  }
}
/*
  Future<void> registerUser() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );

      String userId = userCredential.user!.uid;

      await FirebaseFirestore.instance.collection('users').add({
        "firstName": firstNameController.text,
        'lastName': lastNameController.text,
        'phoneNumber': phoneNumberController.text,
        'email': email,
        // 'createdAt': FieldValue.serverTimestamp(),
      });

      print("User registered and data saved to Firestore");
    } catch (e) {
      print("Error during registration: $e");
      showSnackBar(context, "An error occurred: $e");
    }
  }

*/
  // Future<void> registerUser() async {
  //   UserCredential userCredential =
  //       await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //     email: email!,
  //     password: password!,
  //   );
  //   // String userId = user.user!.uid;
  //   await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(userCredential.user!.uid)
  //       .set({
  //     'firstName': firstNameController.text,
  //     'lastName': lastNameController.text,
  //     'phoneNumber': phoneNumberController.text,
  //     'email': email,
  //     'createdAt': FieldValue.serverTimestamp(),
  //   });
  // }
// }
