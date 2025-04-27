import 'package:flutter/material.dart';
import 'package:h_l_s_application/constants.dart';

class ChatSend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          spacing: 15,
          children: [
            Container(
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Ask me anything...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(Icons.mic, color: kPrimaryColor),
                  SizedBox(width: 8),
                  Icon(Icons.attach_file, color: kPrimaryColor),
                  SizedBox(width: 8),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                decoration: const BoxDecoration(
                  color: kSecondaryColor,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(10),
                child: const Icon(Icons.arrow_upward, color: kPrimaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
