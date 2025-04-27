import 'package:flutter/material.dart';
import 'package:h_l_s_application/constants.dart';

class chatbubbleForUser extends StatelessWidget {
  const chatbubbleForUser({super.key, required this.massege});
  final String massege;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding:
            const EdgeInsets.only(top: 16, bottom: 16, left: 18, right: 25),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32)),
            color: Colors.white),
        child: Text(
          massege,
          style: const TextStyle(color: kPrimaryColor, fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
