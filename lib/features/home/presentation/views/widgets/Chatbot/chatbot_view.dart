import 'package:flutter/material.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/Chatbot/chatbot_sevice.dart';

class ChatbotView extends StatefulWidget {
  const ChatbotView({super.key});

  @override
  _ChatBotViewState createState() => _ChatBotViewState();
}

class _ChatBotViewState extends State<ChatbotView> {
  final List<Map<String, String>> _messages =
      []; // قائمة الرسائل (نص + نوع المرسل)
  final TextEditingController _controller = TextEditingController();
  bool _isLoading = false; // حالة تحميل الرد

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
    return Scaffold(
      body: Column(
        children: [
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
                            radius: 20,
                            backgroundImage: AssetImage(
                                "assets/Images/test1.jpg"), // صورة الشات بوت
                          ),
                          const SizedBox(width: 10), // مسافة بين الصورة والنص
                        ],
                        Flexible(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                              color: message["sender"] == "user"
                                  ? kSecondaryColor
                                  : Colors.grey[500],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              message["text"]!,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        if (message["sender"] == "user") ...[
                          const SizedBox(width: 10), // مسافة بين النص والأيقونة
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
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'أرسل رسالة....',
                      hintStyle: const TextStyle(
                          fontFamily: "Alexandria", fontSize: 13),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(20), // جعل الحواف دائرية
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.blue),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
