import 'package:flutter/material.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/Chatbot/widgets/custom_appbar.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/Chatbot/widgets/custom_textfield.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/Chatbot/widgets/customchatbubbleforUser.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/Chatbot/widgets/customchaybubbleforAi.dart';

class ChatbotView extends StatelessWidget {
  const ChatbotView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 60,
        ),
        const CustomAppbar(),
        const SizedBox(
          height: 30,
        ),
        const chatbubbleforAi(
            massege:
                'Hello, I’m FitBot! 👋 I’m your personal sport assistant. How can I help you?'),
        const chatbubbleForUser(
          massege: 'Book me a visit in a gym',
        ),
        const chatbubbleForUser(
            massege: 'Show me other sports facilities around'),
        const Spacer(),
        ChatSend(),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
