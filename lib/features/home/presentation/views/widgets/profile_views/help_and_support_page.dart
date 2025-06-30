// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/Chatbot/chatbot_sevice.dart';

class HelpAndSupportPage extends StatefulWidget {
  const HelpAndSupportPage({super.key});

  @override
  _HelpAndSupportPage createState() => _HelpAndSupportPage();
}

class _HelpAndSupportPage extends State<HelpAndSupportPage> {
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      padding: const EdgeInsetsDirectional.all(0),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 28,
                      ),
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                    ),
                    Text(
                      "Help & support",
                      style: Styles.textStyle20
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(),
                  ],
                ),
              ),
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
                              // const CircleAvatar(
                              //   backgroundColor: kPrimaryColor,
                              //   radius: 20,
                              //   backgroundImage:
                              //       AssetImage('assets/Images/projLogo.png'),
                              // ),
                              // const SizedBox(width: 10),
                            ],
                            Flexible(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
                                margin: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                    color: message["sender"] == "user"
                                        ? Colors.white
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
                            if (message["sender"] == "user") ...[
                              // const SizedBox(width: 10),
                              // const CircleAvatar(
                              //   radius: 20,
                              //   backgroundColor: kSecondaryColor,
                              //   child: Icon(
                              //     Icons.person,
                              //     color: Colors.black,
                              //   ),
                              // ),
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
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        textAlignVertical: TextAlignVertical.top,
                        style:
                            Styles.textStyle16.copyWith(color: kPrimaryColor),
                        controller: _controller,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          // suffix: IconButton(
                          //   constraints: const BoxConstraints(),
                          //   onPressed: () {},
                          //   icon: const Icon(
                          //     Icons.mic_none_rounded,
                          //     color: kPrimaryColor,
                          //   ),
                          // ),
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
