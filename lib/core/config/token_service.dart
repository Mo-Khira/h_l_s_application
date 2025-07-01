import 'package:shared_preferences/shared_preferences.dart';

class TokenService {
  static const String _tokenKey = 'token';

  // 🟢 تخزين التوكن
  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  // 🔵 استرجاع التوكن
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  // 🔴 حذف التوكن (مثلاً وقت تسجيل الخروج)
  static Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }

  static Future<void> saveUserData(Map<String, dynamic> userData) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('first_name', userData['first_name']);
    await prefs.setString('last_name', userData['last_name']);
    await prefs.setString('email', userData['email']);
    await prefs.setString('phone', userData['phone']);
  }

  static Future<Map<String, String>> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'first_name': prefs.getString('first_name') ?? '',
      'last_name': prefs.getString('last_name') ?? '',
      'email': prefs.getString('email') ?? '',
      'phone': prefs.getString('phone') ?? '',
    };
  }
}


// 🔑 لو عايز تستخدم التوكن في أي طلب API:
// String? token = await TokenService.getToken();

// if (token != null) {
//   dio.options.headers['Authorization'] = 'Bearer $token';
// }


// 🔒 لو هتسجل خروج:
// await TokenService.clearToken();