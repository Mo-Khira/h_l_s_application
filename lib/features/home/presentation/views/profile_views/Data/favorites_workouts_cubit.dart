import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesWorkoutCubit extends Cubit<List<Map<String, dynamic>>> {
  FavoritesWorkoutCubit() : super([]);

  void toggleFavorite(Map<String, dynamic> workout) {
    final exists = state.any((item) => item['title'] == workout['title']);
    if (exists) {
      emit(state.where((item) => item['title'] != workout['title']).toList());
    } else {
      emit([...state, workout]);
    }
  }

  void removeFavorite(String title) {
    emit(state.where((item) => item['title'] != title).toList());
  }

  bool isFavorite(String title) {
    return state.any((item) => item['title'] == title);
  }
}
