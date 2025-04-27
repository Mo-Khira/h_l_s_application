import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/assets.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_form_text_field.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_login_button.dart';

class EditProfilePage extends StatefulWidget {
  EditProfilePage({super.key});

  String selectedGender = "Male";
  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Row(
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
              const SizedBox(height: 35),
              Stack(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage(AssetsData.logo),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Full Name"),
                  const SizedBox(
                    height: 9,
                  ),
                  const CustomFormTextFieldEdit(
                    ini: "Mohammed Khira",
                  ),
                  const SizedBox(height: 15),
                  const Text("Phone"),
                  const SizedBox(
                    height: 9,
                  ),
                  const CustomFormTextFieldEdit(
                    ini: "01004465953",
                  ),
                  const SizedBox(height: 15),
                  const Text("Email Address"),
                  const SizedBox(
                    height: 9,
                  ),
                  const CustomFormTextFieldEdit(
                    ini: "MohammedKhira@gmail.com",
                  ),
                  const SizedBox(height: 15),
                  const Text("Weight"),
                  const SizedBox(
                    height: 9,
                  ),
                  const CustomFormTextFieldEdit(
                    ini: "62",
                  ),
                  const SizedBox(height: 15),
                  const Text("Height"),
                  const SizedBox(
                    height: 9,
                  ),
                  const CustomFormTextFieldEdit(
                    ini: "172",
                  ),
                  const SizedBox(height: 15),
                  const Text("Age"),
                  const SizedBox(
                    height: 9,
                  ),
                  const CustomFormTextFieldEdit(
                    ini: "22",
                  ),
                  const SizedBox(height: 15),
                  const Text("Gender"),
                  const SizedBox(
                    height: 9,
                  ),
                  CustomDropdownButtonEdit(
                    ini: widget.selectedGender,
                    onChanged: (newValue) {
                      setState(
                        () {
                          widget.selectedGender = newValue ?? "";
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomLoginButton(
                    text: 'Save',
                  ),
                  const SizedBox(
                    height: 12,
                  )
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class CustomFormTextFieldEdit extends StatelessWidget {
  const CustomFormTextFieldEdit({super.key, required this.ini});

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
