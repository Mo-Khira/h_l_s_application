// import 'package:dio/dio.dart';

// class ApiService {
//   static final Dio _dio = Dio(
//     BaseOptions(
//       baseUrl: 'http://127.0.0.1:8000/api/', // غيّرها حسب IP السيرفر
//       connectTimeout: const Duration(seconds: 10),
//       receiveTimeout: const Duration(seconds: 10),
//       headers: {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//     ),
//   );

//   // POST request
//   static Future<Response> post({
//     required String endpoint,
//     required Map<String, dynamic> data,
//   }) async {
//     return await _dio.post(endpoint, data: data);
//   }

//   // GET request (لو حبيت تستخدمه بعدين)
//   static Future<Response> get(String endpoint) async {
//     return await _dio.get(endpoint);
//   }

//   // مثال لو عايز تضيف Authorization لاحقًا
//   static void setToken(String token) {
//     _dio.options.headers['Authorization'] = 'Bearer $token';
//   }
// }

import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse("http://127.0.0.1:8000/api/login/");
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      print("Login Success: $body");
    } else {
      throw Exception("Login failed: ${response.body}");
    }
  }
}
