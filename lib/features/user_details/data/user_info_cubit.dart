import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  UserInfoCubit() : super(UserInfoState());

  void setAge(int age) {
    emit(state.copyWith(age: age));
  }

  void setWeight(int weight) {
    emit(state.copyWith(weight: weight));
  }

  void setGoalWeight(int goalWeight) {
    emit(state.copyWith(goalWeight: goalWeight));
  }

  void setHeight(int height) {
    emit(state.copyWith(height: height));
  }

  // تقدر تضيف باقي البيانات بنفس الشكل لاحقًا (goal, target weight, etc.)
}
