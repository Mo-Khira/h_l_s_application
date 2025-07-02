import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutsCubit extends Cubit<List<Map<String, dynamic>>> {
  WorkoutsCubit() : super([]);

  void fetchWorkouts() async {
    try {
      // Simulate fetching from backend (replace with Dio if needed)
      await Future.delayed(const Duration(seconds: 1)); // mock delay

      // List<Map<String, dynamic>> response = await fetchFromBackend(); // real fetch

      final response = <Map<String, dynamic>>[]; // empty for now

      if (response.isEmpty) {
        emit(getStaticWorkouts());
      } else {
        emit(response);
      }
    } catch (e) {
      emit(getStaticWorkouts());
    }
  }

  static List<Map<String, dynamic>> getStaticWorkouts() {
    return [
      {
        "title": "Full Body Warm Up",
        "subtitle": "20 Exercises • 20 min",
        "cardImage": "assets/Images/Vector 01.png",
        "detailImage": "assets/Images/Vector.png",
        "detailTitle": "Full Body Warm Up",
        "detailSubtitle": "20 Exercises",
        "duration": "20",
        "calories": "120",
      },
      {
        "title": "Both Side Plank",
        "subtitle": "18 Exercises • 14 min",
        "cardImage": "assets/Images/Vector 03.png",
        "detailImage": "assets/Images/Group.png",
        "detailTitle": "Both Side Plank",
        "detailSubtitle": "18 Exercises",
        "duration": "14",
        "calories": "100",
      },
      {
        "title": "Abs Workout",
        "subtitle": "16 Exercises • 18 min",
        "cardImage": "assets/Images/Vector 04.png",
        "detailImage": "assets/Images/Group-1.png",
        "detailTitle": "Abs Workout",
        "detailSubtitle": "16 Exercises",
        "duration": "18",
        "calories": "90",
      },
      {
        "title": "Torso and Trap Workout",
        "subtitle": "8 Exercises • 10 min",
        "cardImage": "assets/Images/Vector 04 (1).png",
        "detailImage": "assets/Images/Group-2.png",
        "detailTitle": "Torso and Trap Workout",
        "detailSubtitle": "8 Exercises",
        "duration": "10",
        "calories": "70",
      },
      {
        "title": "Lower Back Exercise",
        "subtitle": "15 Exercises • 15 min",
        "cardImage": "assets/Images/Vector 04 (2).png",
        "detailImage": "assets/Images/Vector 6.png",
        "detailTitle": "Lower Back Exercise",
        "detailSubtitle": "15 Exercises",
        "duration": "15",
        "calories": "85",
      },
      {
        "title": "Strength Exercise",
        "subtitle": "12 Exercises • 14 min",
        "cardImage": "assets/Images/Vector 02.png",
        "detailImage": "assets/Images/Group-3.png",
        "detailTitle": "Strength Exercise",
        "detailSubtitle": "12 Exercises",
        "duration": "14",
        "calories": "110",
      },
    ];
  }
}
