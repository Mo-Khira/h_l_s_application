// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:h_l_s_application/features/auth/data/api_server.dart';
// import 'package:h_l_s_application/features/auth/data/signup_state.dart';

// class SignupCubit extends Cubit<SignupState> {
//   SignupCubit() : super(SignupInitial());

//   Future<void> signupUser({
//     required String firstName,
//     required String lastName,
//     required String email,
//     required String password,
//     required String phoneNumber,
//   }) async {
//     emit(SignupLoading());
//     try {
//       final response = await ApiService.post('auth/register/', {
//         'first_name': firstName,
//         'last_name': lastName,
//         'email': email,
//         'password': password,
//         'phone_number': phoneNumber,
//       });

//       if (response['success'] == true) {
//         emit(SignupSuccess());
//       } else {
//         emit(SignupFailure(response['message'] ?? 'Registration failed'));
//       }
//     } catch (e) {
//       emit(SignupFailure(e.toString()));
//     }
//   }
// }

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_l_s_application/core/services/auth_repo.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepo authRepo;

  SignupCubit(this.authRepo) : super(SignupInitial());

  Future<void> signup({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String password,
  }) async {
    emit(SignupLoading());
    try {
      await authRepo.signup(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
        password: password,
      );
      emit(SignupSuccess());
    } catch (e) {
      emit(SignupFailure(e.toString()));
    }
  }
}
