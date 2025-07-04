// ignore_for_file: unused_import

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_l_s_application/core/utils/api_service.dart';
import 'package:h_l_s_application/features/auth/data/login_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void loginUser({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      // final result =
      //     await ApiService.loginUser(email: email, password: password);
      // emit(LoginSuccess());
//
      await Future.delayed(const Duration(seconds: 2));
      if (email == "test@example.com" && password == "12345678") {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure("Invalid email or password"));
      }
//
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:h_l_s_application/core/config/token_service.dart';
// import 'package:h_l_s_application/core/utils/api_service.dart';
// import 'login_state.dart';
// import 'package:dio/dio.dart';

// class LoginCubit extends Cubit<LoginState> {
//   LoginCubit() : super(LoginInitial());

//   Future<void> loginUser({
//     required String email,
//     required String password,
//   }) async {
//     emit(LoginLoading());
//     try {
//       var response = await ApiService.post(
//         endpoint: 'login/',
//         data: {
//           'email': email,
//           'password': password,
//         },
//       );

//       // ✅ استخراج التوكن من الاستجابة
//       final token = response.data['token'];

//       // ✅ تخزين التوكن باستخدام SharedPreferences
//       // final prefs = await SharedPreferences.getInstance();
//       await TokenService.saveToken(token);
//       emit(LoginSuccess());
//     } on DioException catch (e) {
//       emit(LoginFailure(e.response?.data['detail'] ?? 'Login failed'));
//     } catch (e) {
//       emit(LoginFailure('Something went wrong'));
//     }
//   }
// }
