import 'package:flutter/material.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/styles.dart';

class CustomPhoneNumberTextField extends StatelessWidget {
  CustomPhoneNumberTextField({
    super.key,
  });

  final TextEditingController phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextField(
        controller: phoneNumberController,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(
              top: 20,
              bottom: 20,
              right: 10,
              left: 10,
            ),
            labelText: "Phone Number",
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
