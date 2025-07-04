import 'package:flutter/material.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          )),
      child: Row(
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
          const SizedBox(
            width: 5,
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
                      style:
                          Styles.textStyle14.copyWith(color: kSecondaryColor)),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
