import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesMealsCubit extends Cubit<List<Map<String, dynamic>>> {
  FavoritesMealsCubit() : super([]);

  void addFavorite(Map<String, dynamic> meal) {
    if (!state.any((item) => item['title'] == meal['title'])) {
      emit([...state, meal]);
    }
  }

  void removeFavorite(String title) {
    emit(state.where((item) => item['title'] != title).toList());
  }

  bool isFavorite(String title) {
    return state.any((item) => item['title'] == title);
  }

  void setFavoritesFromBackend(List<Map<String, dynamic>> backendFavorites) {
    emit(backendFavorites);
  }
}
