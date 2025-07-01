import 'package:flutter/material.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 18,
        ),
        SizedBox(
          height: 45,
          width: 45,
          child: Image.asset(
            'assets/Images/projLogo.png',
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Chatbot',
                style:
                    Styles.textStyle22.copyWith(fontWeight: FontWeight.bold)),
            Row(
              children: [
                const CircleAvatar(
                  radius: 6,
                  backgroundColor: kSecondaryColor,
                ),
                Text(' online',
                    style: Styles.textStyle14.copyWith(color: kSecondaryColor)),
              ],
            )
          ],
        )
      ],
    );
  }
}
