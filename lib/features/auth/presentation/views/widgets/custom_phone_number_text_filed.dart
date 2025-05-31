import 'package:flutter/material.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class CustomPhoneNumberTextField extends StatefulWidget {
  final TextEditingController controller;

  const CustomPhoneNumberTextField({
    super.key,
    required this.controller,
  });

  @override
  State<CustomPhoneNumberTextField> createState() =>
      _CustomPhoneNumberTextFieldState();
}

class _CustomPhoneNumberTextFieldState
    extends State<CustomPhoneNumberTextField> {
  PhoneNumber number = PhoneNumber(isoCode: 'EG');

  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      onInputChanged: (PhoneNumber number) {
        widget.controller.text = number.phoneNumber ?? '';
      },
      selectorConfig: const SelectorConfig(
        selectorType: PhoneInputSelectorType.DIALOG,
      ),
      initialValue: number,
      textFieldController: TextEditingController(),
      inputDecoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        labelText: "Phone Number",
        labelStyle: Styles.textStyle16.copyWith(fontWeight: FontWeight.w700),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: kSecondaryColor, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: kSecondaryColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: kSecondaryColor, width: 1),
        ),
      ),
    );
  }
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
