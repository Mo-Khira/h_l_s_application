part of 'user_info_cubit.dart';

class UserInfoState {
  final int? age;
  final int? weight;
  final int? goalWeight;
  final int? height;

  const UserInfoState({
    this.age,
    this.weight,
    this.height,
    this.goalWeight,
  });

  UserInfoState copyWith({
    int? age,
    int? weight,
    int? goalWeight,
    int? height,
  }) {
    return UserInfoState(
      age: age ?? this.age,
      weight: weight ?? this.weight,
      goalWeight: goalWeight ?? this.goalWeight,
      height: height ?? this.height,
    );
  }
}
