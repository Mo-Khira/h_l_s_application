import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_l_s_application/features/home/presentation/views/plans_views/meal_plans/meal_details.dart';
import 'package:h_l_s_application/features/home/presentation/views/plans_views/meal_plans/meal_list.dart';

class MealsCubit extends Cubit<List<Meal>> {
  MealsCubit() : super([]);

  void loadMealsFromBackend(List<dynamic> jsonData) {
    try {
      final meals = parseMealsFromBackend(jsonData);
      emit(meals);
    } catch (e) {
      emit(getStaticMeals()); // fallback
    }
  }

  void loadStaticMeals() {
    emit(getStaticMeals());
  }
}
