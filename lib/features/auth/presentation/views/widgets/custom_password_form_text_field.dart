import 'package:flutter/material.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/styles.dart';

class CustomPasswordFormTextField extends StatefulWidget {
  CustomPasswordFormTextField(
      {super.key,
      required this.text,
      this.onChanged,
      this.formTextFieldController});

  final String text;
  Function(String)? onChanged;
  final TextEditingController? formTextFieldController;

  @override
  State<CustomPasswordFormTextField> createState() =>
      _CustomPasswordFormTextFieldState();
}

class _CustomPasswordFormTextFieldState
    extends State<CustomPasswordFormTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "please Enter your password";
          }
          return null;
        },
        onChanged: widget.onChanged,
        obscureText: _obscureText,
        controller: widget.formTextFieldController,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(
            top: 20,
            bottom: 20,
            right: 10,
            left: 10,
          ),
          labelText: widget.text,
          labelStyle: Styles.textStyle16.copyWith(fontWeight: FontWeight.w700),
          border: textFieldBorderStyle(),
          enabledBorder: textFieldBorderStyle(),
          focusedBorder: textFieldBorderStyle(),
          focusColor: kSecondaryColor,
          floatingLabelStyle: const TextStyle(color: kSecondaryColor),
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined, // تغيير الأيقونة
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText; // تغيير حالة إخفاء النص
              });
            },
          ),
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
