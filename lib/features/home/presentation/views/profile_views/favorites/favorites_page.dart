import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/app_router.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_login_button.dart';
import 'package:h_l_s_application/features/home/presentation/views/plans_views/meal_plans/data/meal_cubit.dart';
import 'package:h_l_s_application/features/home/presentation/views/plans_views/meal_plans/meal_list.dart';
import 'package:h_l_s_application/features/home/presentation/views/plans_views/meal_plans/meals_details.dart';
import 'package:h_l_s_application/features/home/presentation/views/plans_views/training_plans/data/workouts_cubit.dart';
import 'package:h_l_s_application/features/home/presentation/views/plans_views/training_plans/training_detail_screen.dart';
import 'package:h_l_s_application/features/home/presentation/views/plans_views/training_plans/training_list.dart';
import 'package:h_l_s_application/features/home/presentation/views/profile_views/Data/favorites_meals_cubit.dart';
import 'package:h_l_s_application/features/home/presentation/views/profile_views/Data/favorites_workouts_cubit.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => FavoritePageState();
}

class FavoritePageState extends State<FavoritePage> {
  bool isMealSelected = true;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> favoriteWorkouts =
        context.watch<FavoritesWorkoutCubit>().state;
    final List<Map<String, dynamic>> favoriteMeals =
        context.watch<FavoritesMealsCubit>().state;

    final List<Map<String, dynamic>> favorites =
        isMealSelected ? favoriteMeals : favoriteWorkouts;

    final allMeals = context.read<MealsCubit>().state;
    final fallbackMeals = getStaticMeals();
    final safeMeals = allMeals.isEmpty ? fallbackMeals : allMeals;

    final allWorkouts = context.read<WorkoutsCubit>().state;
    final fallbackWorkouts = WorkoutsCubit.getStaticWorkouts();
    final exercises = getCommonExercises();
    final safeWorkouts = allWorkouts.isEmpty ? fallbackWorkouts : allWorkouts;

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      padding: const EdgeInsetsDirectional.all(0),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 28,
                      ),
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                    ),
                    Text(
                      "My Favorites",
                      style: Styles.textStyle20
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 32,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              ToggleButtons(
                isSelected: [isMealSelected, !isMealSelected],
                onPressed: (index) {
                  setState(() {
                    isMealSelected = index == 0;
                  });
                },
                borderRadius: BorderRadius.circular(8),
                fillColor: kSecondaryColor,
                disabledColor: Colors.grey,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      "     Meal     ",
                      style: Styles.textStyle18.copyWith(
                        fontWeight: FontWeight.w600,
                        color: isMealSelected ? kPrimaryColor : Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      "   Workout   ",
                      style: Styles.textStyle18.copyWith(
                        fontWeight: FontWeight.w600,
                        color: isMealSelected ? Colors.white : kPrimaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Expanded(
                child: favorites.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Spacer(),
                            Image.asset(
                              isMealSelected
                                  ? 'assets/Images/nofavm.png'
                                  : 'assets/Images/nofavw.png',
                              height: 200,
                              color: Colors.grey[700],
                            ),
                            const SizedBox(height: 40),
                            Text(
                              isMealSelected
                                  ? "Favorite recipes to add \n           them here !"
                                  : "Favorite workouts to add \n            them here !",
                              style: Styles.textStyle18
                                  .copyWith(fontWeight: FontWeight.w400),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 4, right: 4, bottom: 10),
                              child: CustomLoginButton(
                                  text: isMealSelected
                                      ? "Add Meal"
                                      : "Add Workout",
                                  onPressed: isMealSelected
                                      ? () {
                                          GoRouter.of(context)
                                              .push(AppRouter.kMealPlans);
                                        }
                                      : () {
                                          GoRouter.of(context).push(
                                              AppRouter.kTrainingPlanPage);
                                        }),
                            )
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: favorites.length,
                        itemBuilder: (context, index) {
                          final item = favorites[index];
                          return GestureDetector(
                            onTap: () {
                              if (isMealSelected) {
                                final originalMeal = safeMeals.firstWhere(
                                  (meal) => meal.title == item['title'],
                                  // orElse: () => null,
                                );

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => MealsDetails(
                                      imagePath: originalMeal.imagePath,
                                      title: originalMeal.title,
                                      calories: originalMeal.calories,
                                      cookTime: originalMeal.cookTime,
                                      ingredients: originalMeal.ingredients,
                                      fat: originalMeal.fat,
                                      protein: originalMeal.protein,
                                      carbs: originalMeal.carbs,
                                    ),
                                  ),
                                );
                              } else {
                                final originalWorkout = safeWorkouts.firstWhere(
                                  (w) => w["title"] == item["title"],
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => TrainingDetailScreen(
                                      imagePath: originalWorkout["detailImage"],
                                      title: originalWorkout["detailTitle"],
                                      subtitle:
                                          originalWorkout["detailSubtitle"],
                                      duration: originalWorkout["duration"],
                                      exercises: exercises,
                                      selectedIndex: 0,
                                    ),
                                  ),
                                );
                              }
                            },
                            child: Card(
                              color: kPrimaryColor,
                              margin: const EdgeInsets.only(bottom: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(15)),
                                        child: Image.asset(
                                          item['image'],
                                          height: 150,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                        top: 8,
                                        right: 8,
                                        child: Container(
                                          width: 28,
                                          height: 28,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Center(
                                            child: IconButton(
                                              icon: Icon(
                                                Icons.favorite,
                                                color: Colors.red[600],
                                              ),
                                              padding: EdgeInsets.zero,
                                              onPressed: () {
                                                if (isMealSelected) {
                                                  context
                                                      .read<
                                                          FavoritesMealsCubit>()
                                                      .removeFavorite(
                                                          item['title']);
                                                } else {
                                                  context
                                                      .read<
                                                          FavoritesWorkoutCubit>()
                                                      .removeFavorite(
                                                          item['title']);
                                                }
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item['title'],
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            SizedBox(
                                              child: Image.asset(
                                                'assets/Images/fire.png',
                                                color: Colors.cyan,
                                              ),
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              isMealSelected
                                                  ? '${item['calories']}'
                                                  : '${item['calories']} kcal',
                                              style: const TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            const SizedBox(width: 12),
                                            const Icon(Icons.access_time,
                                                color: Colors.cyan, size: 16),
                                            const SizedBox(width: 4),
                                            Text(
                                              isMealSelected
                                                  ? '${item['time']}'
                                                  : '${item['time']} min',
                                              style: const TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
