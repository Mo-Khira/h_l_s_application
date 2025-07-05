import 'package:flutter/material.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:h_l_s_application/features/home/presentation/views/Chatbot/data/chatbot_offline_data.dart';
import 'package:h_l_s_application/features/home/presentation/views/Chatbot/widgets/custom_appbar.dart';

class ChatbotView extends StatefulWidget {
  const ChatbotView({super.key});

  @override
  ChatBotViewState createState() => ChatBotViewState();
}

class ChatBotViewState extends State<ChatbotView> {
  final List<Map<String, String>> _messages = [];
  final TextEditingController _controller = TextEditingController();
  bool _isLoading = false;

  void _sendMessage() async {
    if (_controller.text.isEmpty) return;

    String userMessage = _controller.text;
    setState(() {
      _messages.insert(0, {"sender": "user", "text": userMessage});
      _controller.clear();
      _isLoading = true;
    });

    await Future.delayed(
      const Duration(seconds: 1),
    );

    String botResponse = OfflineChatBot.getResponse(userMessage);

    setState(() {
      _messages.insert(0, {"sender": "bot", "text": botResponse});
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const CustomAppBar(),
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return Align(
                    alignment: message["sender"] == "user"
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: message["sender"] == "user"
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (message["sender"] == "bot") ...[
                            const CircleAvatar(
                              backgroundColor: kPrimaryColor,
                              radius: 20,
                              backgroundImage: AssetImage(
                                'assets/Images/projLogo.png',
                              ),
                            ),
                          ],
                          Flexible(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.symmetric(
                                  vertical: 1, horizontal: 10),
                              decoration: BoxDecoration(
                                  color: message["sender"] == "user"
                                      ? kSecondaryColor
                                      : Colors.white,
                                  borderRadius: message["sender"] == "user"
                                      ? const BorderRadius.only(
                                          topLeft: Radius.circular(14),
                                          bottomLeft: Radius.circular(14),
                                          bottomRight: Radius.circular(14),
                                        )
                                      : const BorderRadius.only(
                                          topRight: Radius.circular(14),
                                          bottomLeft: Radius.circular(14),
                                          bottomRight: Radius.circular(14),
                                        )),
                              child: Text(
                                message["text"]!,
                                style: Styles.textStyle16
                                    .copyWith(color: kPrimaryColor),
                              ),
                            ),
                          ),
                          if (message["sender"] == "user") ...[],
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            if (_isLoading)
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(
                  color: kSecondaryColor,
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      textAlignVertical: TextAlignVertical.top,
                      style: Styles.textStyle16.copyWith(color: kPrimaryColor),
                      controller: _controller,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: ' Ask me anything...',
                        hintStyle:
                            Styles.textStyle16.copyWith(color: kPrimaryColor),
                        border: textFieldBorderStyle(),
                        enabledBorder: textFieldBorderStyle(),
                        focusedBorder: textFieldBorderStyle(),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 8,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: kSecondaryColor,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.keyboard_arrow_up_rounded,
                          size: 40, color: kPrimaryColor),
                      onPressed: _sendMessage,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  OutlineInputBorder textFieldBorderStyle() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(
        style: BorderStyle.solid,
        color: kSecondaryColor,
        width: 1,
      ),
    );
  }
}
