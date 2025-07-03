import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class GeminiService {
  static const String apiKey = "....api key...";
  static const String apiUrl =
      "https://generativelanguage.googleapis.com/v1beta/models/$apiKey";

  static Future<String> sendMessage(String message) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "contents": [
            {
              "parts": [
                {"text": message}
              ]
            }
          ]
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data["candidates"][0]["content"]["parts"][0]["text"];
      } else {
        return "Error in server: ${response.statusCode}";
      }
    } catch (e) {
      return "Error in connection: $e";
    }
  }
}
