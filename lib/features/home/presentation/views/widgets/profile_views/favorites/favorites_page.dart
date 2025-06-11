import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/app_router.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_login_button.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  bool isMealSelected = true;

  List<Map<String, dynamic>> favoriteMeals = [
    {
      'image': 'assets/Images/img (1).png',
      'title': 'Greek salad with lettuce, green onion',
      'calories': 150,
      'time': 30,
    },
    {
      'image': 'assets/Images/img (1).png',
      'title': 'Green beans, tomatoes, eggs',
      'calories': 135,
      'time': 30,
    },
    {
      'image': 'assets/Images/img (1).png',
      'title': 'Healthy Snacks',
      'calories': 178,
      'time': 30,
    },
  ];

  List<Map<String, dynamic>> favoriteWorkouts = [];

  @override
  Widget build(BuildContext context) {
    final favorites = isMealSelected ? favoriteMeals : favoriteWorkouts;

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
            children: [
              const SizedBox(height: 18),
              Row(
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Image.asset('assets/images/empty.png', height: 200),
                            const SizedBox(height: 20),
                            const Text(
                              "No favorites yet!",
                              style: TextStyle(color: Colors.white),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 12, right: 12, bottom: 10),
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
                        // padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemBuilder: (context, index) {
                          final item = favorites[index];
                          return Card(
                            color: kPrimaryColor,
                            margin: const EdgeInsets.only(bottom: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                          top: Radius.circular(8)),
                                      child: Image.asset(
                                        item['image'],
                                        height: 180,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      top: 8,
                                      right: 8,
                                      child: IconButton(
                                        icon: const Icon(Icons.favorite,
                                            color: Colors.red),
                                        onPressed: () {
                                          setState(() {
                                            favorites.removeAt(index);
                                          });
                                        },
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
                                            color: Colors.white, fontSize: 16),
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
                                          Text('${item['calories']} kcal',
                                              style: const TextStyle(
                                                  color: Colors.grey)),
                                          const SizedBox(width: 12),
                                          const Icon(Icons.access_time,
                                              color: Colors.cyan, size: 16),
                                          const SizedBox(width: 4),
                                          Text('${item['time']} min',
                                              style: const TextStyle(
                                                  color: Colors.grey)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
