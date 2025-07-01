// ignore_for_file: must_be_immutable, use_build_context_synchronously, avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/config/token_service.dart';
import 'package:h_l_s_application/core/utils/assets.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_login_button.dart';
import 'package:h_l_s_application/features/user_details/data/user_info_cubit.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  String selectedGender = "Male";
  String fullName = '';
  String email = '';
  String phone = '';

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final ageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  void loadUserData() async {
    final data = await TokenService.getUserData();
    final userInfo = context.read<UserInfoCubit>().state;
    setState(() {
      fullName = '${data['first_name']} ${data['last_name']}';
      email = data['email']!;
      phone = data['phone']!;
      weightController.text = userInfo.weight?.toString() ?? '';
      heightController.text = userInfo.height?.toString() ?? '';
      ageController.text = userInfo.age?.toString() ?? '';
    });
  }

  Future<void> updateProfileOnBackend() async {
    final token = await TokenService.getToken();
    final dio = Dio()..options.headers['Authorization'] = 'Bearer $token';

    try {
      await dio.put(
        'http://127.0.0.1:8000/api/update-profile/', // TODO APISS
        data: {
          'first_name': nameController.text.split(" ").first,
          'last_name': nameController.text.split(" ").last,
          'email': emailController.text,
          'phone': phoneController.text,
          'weight': int.tryParse(weightController.text),
          'height': int.tryParse(heightController.text),
          'age': int.tryParse(ageController.text),
          'gender': selectedGender,
        },
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Profile updated successfully")),
      );
    } catch (e) {
      print("Update failed: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to update profile")),
      );
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      padding: const EdgeInsetsDirectional.all(0),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 28,
                      ),
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                    ),
                    Text(
                      "Edit Profile",
                      style: Styles.textStyle20
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 35),
              Stack(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage(AssetsData.messi),
                    backgroundColor: Colors.white,
                    radius: 55,
                  ),
                  Positioned(
                    bottom: -10,
                    right: -10,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                        color: kSecondaryColor,
                      ),
                      iconSize: 28,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15),
              BlocBuilder<UserInfoCubit, UserInfoState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Full Name"),
                      const SizedBox(
                        height: 9,
                      ),
                      CustomFormTextFieldEdit(
                        ini: fullName,
                        controller: nameController,
                      ),
                      const SizedBox(height: 15),
                      const Text("Phone"),
                      const SizedBox(
                        height: 9,
                      ),
                      CustomFormTextFieldEdit(
                        controller: phoneController,
                        ini: phone,
                      ),
                      const SizedBox(height: 15),
                      const Text("Email Address"),
                      const SizedBox(
                        height: 9,
                      ),
                      CustomFormTextFieldEdit(
                        controller: emailController,
                        ini: email,
                      ),
                      const SizedBox(height: 15),
                      const Text("Weight"),
                      const SizedBox(
                        height: 9,
                      ),
                      CustomFormTextFieldEdit(
                        controller: weightController,
                        ini: state.weight?.toString() ?? "62",
                      ),
                      const SizedBox(height: 15),
                      const Text("Height"),
                      const SizedBox(
                        height: 9,
                      ),
                      CustomFormTextFieldEdit(
                        controller: heightController,
                        ini: state.height?.toString() ?? "172",
                      ),
                      const SizedBox(height: 15),
                      const Text("Age"),
                      const SizedBox(
                        height: 9,
                      ),
                      CustomFormTextFieldEdit(
                        controller: ageController,
                        ini: state.age?.toString() ?? "22",
                      ),
                      const SizedBox(height: 15),
                      const Text("Gender"),
                      const SizedBox(
                        height: 9,
                      ),
                      CustomDropdownButtonEdit(
                        ini: selectedGender,
                        onChanged: (newValue) {
                          setState(
                            () {
                              selectedGender = newValue ?? "";
                            },
                          );
                        },
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      CustomLoginButton(
                        text: 'Save',
                        onPressed: () {
                          final userInfoCubit = context.read<UserInfoCubit>();

                          userInfoCubit
                              .setAge(int.tryParse(ageController.text) ?? 0);
                          userInfoCubit.setWeight(
                              int.tryParse(weightController.text) ?? 0);
                          userInfoCubit.setHeight(
                              int.tryParse(heightController.text) ?? 0);

                          // Call update API here
                          updateProfileOnBackend();
                        },
                      ),
                      const SizedBox(
                        height: 12,
                      )
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class CustomFormTextFieldEdit extends StatelessWidget {
  final TextEditingController controller;

  const CustomFormTextFieldEdit(
      {super.key, required this.ini, required this.controller});

  final String ini;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "required field";
          }
          return null;
        },
        initialValue: ini,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(
              top: 20,
              bottom: 20,
              right: 10,
              left: 10,
            ),
            labelStyle:
                Styles.textStyle16.copyWith(fontWeight: FontWeight.w700),
            border: textFieldBorderStyle(),
            enabledBorder: textFieldBorderStyle(),
            focusedBorder: textFieldBorderStyle(),
            focusColor: kSecondaryColor,
            floatingLabelStyle: const TextStyle(color: kSecondaryColor)),
      ),
    );
  }

  OutlineInputBorder textFieldBorderStyle() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        style: BorderStyle.solid,
        color: kSecondaryColor,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(8),
    );
  }
}

class CustomDropdownButtonEdit extends StatelessWidget {
  const CustomDropdownButtonEdit({
    super.key,
    required this.ini,
    required this.onChanged,
  });

  final String ini;
  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: DropdownButtonFormField<String>(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "required field";
          }
          return null;
        },
        value: ini.isNotEmpty ? ini : null,
        onChanged: onChanged,
        items: const [
          DropdownMenuItem(
            value: "Male",
            child: Text("Male"),
          ),
          DropdownMenuItem(
            value: "Female",
            child: Text("Female"),
          ),
        ],
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(
            top: 20,
            bottom: 20,
            right: 10,
            left: 10,
          ),
          labelStyle: Styles.textStyle16.copyWith(fontWeight: FontWeight.w700),
          border: textFieldBorderStyle(),
          enabledBorder: textFieldBorderStyle(),
          focusedBorder: textFieldBorderStyle(),
          focusColor: kSecondaryColor,
          floatingLabelStyle: const TextStyle(color: kSecondaryColor),
        ),
      ),
    );
  }

  OutlineInputBorder textFieldBorderStyle() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        style: BorderStyle.solid,
        color: kSecondaryColor,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(8),
    );
  }
}
