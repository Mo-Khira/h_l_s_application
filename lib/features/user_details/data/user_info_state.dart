part of 'user_info_cubit.dart';

class UserInfoState {
  final int? age;
  final int? weight;
  final int? goalWeight;
  final int? height;
  final String? fitnessLevel;
  final String? fitnessGoalLevel;
  final String? activityLevel;

  const UserInfoState({
    this.age,
    this.weight,
    this.height,
    this.goalWeight,
    this.fitnessLevel,
    this.fitnessGoalLevel,
    this.activityLevel,
  });

  UserInfoState copyWith({
    int? age,
    int? weight,
    int? goalWeight,
    int? height,
    String? fitnessLevel,
    String? fitnessGoalLevel,
    String? activityLevel,
  }) {
    return UserInfoState(
      age: age ?? this.age,
      weight: weight ?? this.weight,
      goalWeight: goalWeight ?? this.goalWeight,
      height: height ?? this.height,
      fitnessLevel: fitnessLevel ?? this.fitnessLevel,
      fitnessGoalLevel: fitnessGoalLevel ?? this.fitnessGoalLevel,
      activityLevel: activityLevel ?? this.activityLevel,
    );
  }
}
