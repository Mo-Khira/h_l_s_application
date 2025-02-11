import 'package:flutter/material.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class CustomPhoneNumberTextField extends StatefulWidget {
  CustomPhoneNumberTextField({
    super.key,
  });

  @override
  State<CustomPhoneNumberTextField> createState() =>
      _CustomPhoneNumberTextFieldState();
}

class _CustomPhoneNumberTextFieldState
    extends State<CustomPhoneNumberTextField> {
  final TextEditingController phoneNumberController = TextEditingController();
  String phoneNumber = '';
  PhoneNumber number = PhoneNumber(isoCode: 'EG');

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(left: 8),
          decoration: BoxDecoration(
            border: Border.all(
              style: BorderStyle.solid,
              color: kSecondaryColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          height: 60,
          width: 100,
        ),
        Container(
          padding: const EdgeInsets.only(left: 8),
          height: 60,
          child: InternationalPhoneNumberInput(
            onInputChanged: (PhoneNumber number) {
              phoneNumber = number.phoneNumber!;
            },
            selectorConfig: const SelectorConfig(
              selectorType: PhoneInputSelectorType.DIALOG,
            ),
            initialValue: number,
            textFieldController: TextEditingController(),
            spaceBetweenSelectorAndTextField: 0,
            inputDecoration: InputDecoration(
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
              floatingLabelStyle: const TextStyle(color: kSecondaryColor),
            ),
          ),
        ),
      ],
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
