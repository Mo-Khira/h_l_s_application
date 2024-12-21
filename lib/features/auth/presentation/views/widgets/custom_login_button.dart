import 'package:flutter/material.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/styles.dart';

class CustomLoginButton extends StatelessWidget {
  CustomLoginButton({super.key, required this.text, this.onPressed});

  VoidCallback? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return RawMaterialButton(
      splashColor: kPrimaryColor,
      elevation: 2,
      onPressed: onPressed,
      child: Container(
        alignment: Alignment.center,
        height: 60,
        width: screenWidth,
        decoration: BoxDecoration(
            color: kSecondaryColor, borderRadius: BorderRadius.circular(8)),
        child: Text(
          text,
          style: Styles.textStyle18
              .copyWith(color: kPrimaryColor, fontWeight: FontWeight.w800),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
