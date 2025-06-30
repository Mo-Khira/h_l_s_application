import 'package:flutter/material.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/Chatbot/chatbot_sevice.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/Chatbot/widgets/custom_appbar.dart';

class ChatbotView extends StatefulWidget {
  const ChatbotView({super.key});

  @override
  _ChatBotViewState createState() => _ChatBotViewState();
}

class _ChatBotViewState extends State<ChatbotView> {
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

    String botResponse = await GeminiService.sendMessage(userMessage);

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
                        children: [
                          if (message["sender"] == "bot") ...[
                            const CircleAvatar(
                              backgroundColor: kPrimaryColor,
                              radius: 20,
                              backgroundImage:
                                  AssetImage('assets/Images/projLogo.png'),
                            ),
                            const SizedBox(width: 10),
                          ],
                          Flexible(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                color: message["sender"] == "user"
                                    ? kSecondaryColor
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                message["text"]!,
                                style: Styles.textStyle16
                                    .copyWith(color: kPrimaryColor),
                              ),
                            ),
                          ),
                          if (message["sender"] == "user") ...[
                            const SizedBox(width: 10),
                            const CircleAvatar(
                              radius: 20,
                              backgroundColor: kSecondaryColor,
                              child: Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                            ),
                          ],
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
                child: CircularProgressIndicator(),
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
                        suffix: IconButton(
                          constraints:
                              BoxConstraints(), // تعطي حرية للحجم حسب الحاجة

                          onPressed: () {},
                          icon: const Icon(
                            Icons.mic_none_rounded,
                            color: kPrimaryColor,
                          ),
                        ),
                        hintText: 'Ask me anything...',
                        hintStyle:
                            Styles.textStyle16.copyWith(color: kPrimaryColor),
                        border: textFieldBorderStyle(),
                        enabledBorder: textFieldBorderStyle(),
                        focusedBorder: textFieldBorderStyle(),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 15,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_circle_left,
                        size: 40, color: kSecondaryColor),
                    onPressed: _sendMessage,
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
