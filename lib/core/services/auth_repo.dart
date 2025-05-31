import 'package:dio/dio.dart';

class AuthRepo {
  final Dio _dio = Dio();
  final String baseUrl = 'http://127.0.0.1:8000/api/'; // غيّر الرابط حسب مشروعك

  Future<void> signup({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '$baseUrl/signup',
        data: {
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'phone': phone,
          'password': password,
        },
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to register');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Signup failed');
    }
  }
}
