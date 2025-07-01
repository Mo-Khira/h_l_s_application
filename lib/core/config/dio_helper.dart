import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioHelper {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://127.0.0.1:8000/api/',
      headers: {'Content-Type': 'application/json'},
    ),
  );

  static Future<void> setAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token != null) {
      dio.options.headers["Authorization"] = "Bearer $token";
    }
  }
}
