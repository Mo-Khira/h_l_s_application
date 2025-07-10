import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  UserInfoCubit() : super(const UserInfoState());

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

  void setFitnessLevel(String fitnessLevel) {
    emit(state.copyWith(fitnessLevel: fitnessLevel));
  }

  void setFitnessGoalLevel(String fitnessGoalLevel) {
    emit(state.copyWith(fitnessGoalLevel: fitnessGoalLevel));
  }

  void setActivityLevel(String activityLevel) {
    emit(state.copyWith(activityLevel: activityLevel));
  }
}
