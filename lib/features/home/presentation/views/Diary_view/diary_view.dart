import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/app_router.dart';
import 'package:h_l_s_application/core/utils/assets.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_login_button.dart';
import 'package:h_l_s_application/features/home/presentation/views/Diary_view/widgets/custom_build_calendar.dart';
import 'package:h_l_s_application/features/home/presentation/views/Diary_view/widgets/meal_selection_widget.dart';

class DiaryView extends StatefulWidget {
  const DiaryView({super.key});

  @override
  State<DiaryView> createState() => _DiaryViewState();
}

class _DiaryViewState extends State<DiaryView> {
  Map<String, List<String>> scannedItems = {
    'Breakfast': [],
    'Lunch': [],
    'Dinner': [],
    'Add Exercise': [],
  };
  Map<String, bool> isExpanded = {
    'Breakfast': false,
    'Lunch': false,
    'Dinner': false,
    'Add Exercise': false,
  };

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay.now();

  bool isReminderOn = true;

  late int foodCalories = 0;
  late int remainingCalories;

  void _onDateSelected(DateTime newDate) {
    setState(() => selectedDate = newDate);
  }

  Future<void> _handleScan(String title) async {
    final result =
        await GoRouter.of(context).push<String>(AppRouter.kSearchScreen);
    if (result != null) {
      setState(() => scannedItems[title]?.add(result));
    }
  }

  Widget _buildMealSection(String title, String imagePath) {
    final items = scannedItems[title] ?? [];
    final hasItems = items.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MealSelectionWidget(
          title: title,
          imagePath: imagePath,
          onTap: () async {
            final result = await GoRouter.of(context)
                .push<String>(AppRouter.kSearchScreen);
            if (result != null && result.trim().isNotEmpty) {
              setState(() {
                scannedItems[title]?.add(result.trim());
              });
            }
          },
        ),
        if (hasItems)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  items.length == 1
                      ? "${items.length} item"
                      : "${items.length} items",
                  style: Styles.textStyle14.copyWith(color: Colors.white),
                ),
                IconButton(
                  icon: Icon(
                    isExpanded[title]! ? Icons.expand_less : Icons.expand_more,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      isExpanded[title] = !isExpanded[title]!;
                    });
                  },
                ),
              ],
            ),
          ),
        if (hasItems && isExpanded[title]!)
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Column(
              children: items.map((item) {
                final lines = item.split('\n');
                final titleLine =
                    lines.isNotEmpty ? "Avocado fruit" : "Unknown Item";

                String? calories = lines.firstWhere(
                  (line) => line.toLowerCase().contains('calories'),
                  orElse: () => '',
                );
                String? protein = lines.firstWhere(
                  (line) => line.toLowerCase().contains('protein'),
                  orElse: () => '',
                );
                String? carbs = lines.firstWhere(
                  (line) => line.toLowerCase().contains('carbs'),
                  orElse: () => '',
                );

                return ListTile(
                  tileColor: Colors.white.withOpacity(0.07),
                  title: Text(
                    titleLine,
                    style: Styles.textStyle14.copyWith(color: Colors.white),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (calories.isNotEmpty)
                        Text(calories,
                            style: Styles.textStyle12
                                .copyWith(color: Colors.grey[400])),
                      if (protein.isNotEmpty)
                        Text(protein,
                            style: Styles.textStyle12
                                .copyWith(color: Colors.grey[400])),
                      if (carbs.isNotEmpty)
                        Text(carbs,
                            style: Styles.textStyle12
                                .copyWith(color: Colors.grey[400])),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildScannedList(String title) {
    final items = scannedItems[title]!;
    if (items.isEmpty) return const SizedBox();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${items.length} item(s)", style: Styles.textStyle14),
              IconButton(
                icon: Icon(
                  isExpanded[title]! ? Icons.expand_less : Icons.expand_more,
                  color: kPrimaryColor,
                ),
                onPressed: () {
                  setState(() => isExpanded[title] = !isExpanded[title]!);
                },
              ),
            ],
          ),
        ),
        if (isExpanded[title]!)
          Column(
            children: items.map((item) {
              final lines = item.split('\n');
              return ListTile(
                title: Text(lines.first, style: Styles.textStyle14),
                subtitle: Text(lines.sublist(1).join("\n"),
                    style: Styles.textStyle12),
              );
            }).toList(),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(height: kHeight(context) * 0.1),
              CustomBuildCalendar(
                // onDateSelected: (DateTime) {},
                onDateSelected: _onDateSelected,
                selectedDate: selectedDate,
              ), // Custom calendar widget
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Calories Remaining",
                    style: Styles.textStyle14,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "2500",
                        style: Styles.textStyle16,
                      ),
                      Text(
                        "-",
                        style: Styles.textStyle16,
                      ),
                      Text(
                        "$foodCalories",
                        style: Styles.textStyle16,
                      ),
                      Text(
                        "=",
                        style: Styles.textStyle16,
                      ),
                      Text(
                        "${2500 - foodCalories}",
                        style: Styles.textStyle16,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "    Goal  ",
                        style: Styles.textStyle14,
                      ),
                      Text(
                        "     Food",
                        style: Styles.textStyle14,
                      ),
                      Text(
                        "Remaining",
                        style: Styles.textStyle14,
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  _buildMealSection("Breakfast", "assets/Images/img (5).png"),
                  const SizedBox(height: 20),
                  _buildMealSection(
                      "Lunch", "assets/Images/Curry Salmon 3.png"),
                  const SizedBox(height: 20),
                  _buildMealSection("Dinner", "assets/Images/img (4).png"),
                  const SizedBox(height: 70),
                  _buildMealSection("Add Exercise", AssetsData.screen3),
                ],
              ),
              SizedBox(height: kHeight(context) * 0.04),
              CustomLoginButton(
                text: "Complete Diary",
                onPressed: () async {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => const Center(
                      child: CircularProgressIndicator(
                        color: kSecondaryColor,
                      ),
                    ),
                  );

                  await Future.delayed(const Duration(seconds: 2));

                  if (context.mounted) Navigator.pop(context);
                  setState(() {
                    foodCalories += 240;
                  });

                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Diary Completed Successfully!'),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}


/**
 * 
 * 















 */









// ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:h_l_s_application/constants.dart';
// import 'package:h_l_s_application/core/utils/styles.dart';
// import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_login_button.dart';
// import 'package:h_l_s_application/features/home/presentation/views/Diary_view/widgets/custom_build_calendar.dart';
// import 'package:h_l_s_application/features/home/presentation/views/Diary_view/widgets/meal_selection_widget.dart';
// import 'package:h_l_s_application/features/home/presentation/views/plans_views/meal_plans/meal_details.dart';
// import 'package:h_l_s_application/features/home/presentation/views/plans_views/meal_plans/meal_list.dart';
// import 'package:h_l_s_application/features/home/presentation/views/plans_views/training_plans/training_list.dart';

// class DiaryView extends StatefulWidget {
//   const DiaryView({super.key});

//   @override
//   State<DiaryView> createState() => _DiaryViewState();
// }

// class _DiaryViewState extends State<DiaryView> {
//   late int foodCalories = 0;
//   late int remainingCalories;

//   List<Meal> allMeals = getStaticMeals();
//   List<Map<String, dynamic>> allWorkouts = getTrainingPlans();

//   int selectionCount = 0;

//   DateTime selectedDate = DateTime.now();

//   TimeOfDay selectedTime = TimeOfDay.now();

//   bool isReminderOn = true;

//   void _onDateSelected(DateTime newDate) {
//     setState(() => selectedDate = newDate);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: FutureBuilder(
//             future: fetchData(),
//             builder: (context, snapshot) {
//               if (!snapshot.hasData) {
//                 return const Center(child: CircularProgressIndicator());
//               }
//               final data =
//                   snapshot.data as Map<String, List<Map<String, dynamic>>>;
//               return SingleChildScrollView(
//                   child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 child: Column(
//                   children: [
//                     SizedBox(height: kHeight(context) * 0.08),
//                     CustomBuildCalendar(
//                       // onDateSelected: (DateTime) {},
//                       onDateSelected: _onDateSelected,
//                       selectedDate: selectedDate,
//                     ), // Custom calendar widget
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Calories Remaining",
//                           style: Styles.textStyle14,
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Text(
//                               "2500",
//                               style: Styles.textStyle16,
//                             ),
//                             Text(
//                               "-",
//                               style: Styles.textStyle16,
//                             ),
//                             Text(
//                               "$foodCalories",
//                               style: Styles.textStyle16,
//                             ),
//                             Text(
//                               "=",
//                               style: Styles.textStyle16,
//                             ),
//                             Text(
//                               "${2500 - foodCalories}",
//                               style: Styles.textStyle16,
//                             ),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             Text(
//                               "    Goal  ",
//                               style: Styles.textStyle14,
//                             ),
//                             Text(
//                               "     Food",
//                               style: Styles.textStyle14,
//                             ),
//                             Text(
//                               "Remaining",
//                               style: Styles.textStyle14,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),

//                     const SizedBox(
//                       height: 30,
//                     ),
//                     Column(
//                       children: [
//                         MealSelectionWidget(
//                             title: "Breakfast", items: data['breakfastMeals']!),
//                         MealSelectionWidget(
//                             title: "Lunch", items: data['lunchMeals']!),
//                         MealSelectionWidget(
//                             title: "Dinner", items: data['dinnerMeals']!),
//                         const SizedBox(height: 20),
//                         MealSelectionWidget(
//                           title: "Add Exercise",
//                           items: data['exercises']!,
//                           isExercise: true,
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: kHeight(context) * 0.04),
//                     CustomLoginButton(
//                       text: "Complete Diary",
//                       onPressed: () async {
//                         showDialog(
//                           context: context,
//                           barrierDismissible: false,
//                           builder: (_) => const Center(
//                             child: CircularProgressIndicator(
//                               color: kSecondaryColor,
//                             ),
//                           ),
//                         );

//                         await Future.delayed(const Duration(seconds: 2));

//                         if (context.mounted) Navigator.pop(context);
//                         setState(() {
//                           foodCalories += 1580;
//                         });

//                         showDialog(
//                           context: context,
//                           builder: (_) => AlertDialog(
//                             title: const Text('Diary Completed Successfully!'),
//                           ),
//                         );
//                       },
//                     ),

//                     const SizedBox(height: 20),
//                   ],
//                 ),
//               ));
//             }),
//       ),
//     );
//   }

//   Future<Map<String, List<Map<String, dynamic>>>> fetchData() async {
//     await Future.delayed(const Duration(milliseconds: 500));
//     return {
//       'breakfastMeals': [
//         {
//           'name': 'Green beans',
//           'calories': 160,
//           'protein': 10.9,
//           'carbs': 13.5,
//         },
//         {
//           'name': 'Greek salad',
//           'calories': 150,
//           'protein': 20,
//           'carbs': 35,
//         },
//       ],
//       'lunchMeals': [
//         {
//           'name': 'Curry salmon',
//           'calories': 300,
//           'protein': 40,
//           'carbs': 20,
//         },
//         {
//           'name': 'Avocado Dish',
//           'calories': 200,
//           'protein': 6,
//           'carbs': 30,
//         },
//       ],
//       'dinnerMeals': [
//         {
//           'name': 'Healthy Snacks',
//           'calories': 230,
//           'protein': 12,
//           'carbs': 26,
//         },
//         {
//           'name': 'Vegetables salad',
//           'calories': 270,
//           'protein': 8,
//           'carbs': 35,
//         },
//       ],
//       'exercises': [
//         {
//           'name': "Full Body Warm Up",
//           "subtitle": "20 Exercises • 20 min",
//           "cardImage": "assets/Images/Vector 01.png",
//           "detailImage": "assets/Images/Vector.png",
//           "detailTitle": "Full Body Warm Up",
//           "detailSubtitle": "20 Exercises",
//           "duration": "20 min",
//         },
//         {
//           'name': "Both Side Plank",
//           "subtitle": "18 Exercises • 14 min",
//           "cardImage": "assets/Images/Vector 03.png",
//           "detailImage": "assets/Images/Group.png",
//           "detailTitle": "Full Body Warm Up",
//           "detailSubtitle": "18 Exercises",
//           "duration": "14 min",
//         },
//         {
//           'name': "Abs Workout",
//           "subtitle": "16 Exercises • 18 min",
//           "cardImage": "assets/Images/Vector 04.png",
//           "detailImage": "assets/Images/Group-1.png",
//           "detailTitle": "Full Body Warm Up",
//           "detailSubtitle": "16 Exercises",
//           "duration": "18 min",
//         },
//         {
//           'name': "Torso and Trap Workout",
//           "subtitle": "8 Exercises • 10 min",
//           "cardImage": "assets/Images/Vector 04 (1).png",
//           "detailImage": "assets/Images/Group-2.png",
//           "detailTitle": "Full Body Warm Up",
//           "detailSubtitle": "8 Exercises",
//           "duration": "10 min",
//         },
//         {
//           'name': "Lower Back Exercise",
//           "subtitle": "15 Exercises • 15 min",
//           "cardImage": "assets/Images/Vector 04 (2).png",
//           "detailImage": "assets/Images/Vector 6.png",
//           "detailTitle": "Full Body Warm Up",
//           "detailSubtitle": "15 Exercises",
//           "duration": "15 min",
//         },
//         {
//           'name': "Strength Exercise",
//           "subtitle": "12 Exercises • 14 min",
//           "cardImage": "assets/Images/Vector 02.png",
//           "detailImage": "assets/Images/Group-3.png",
//           "detailTitle": "Full Body Warm Up",
//           "detailSubtitle": "12 Exercises",
//           "duration": "14 min",
//         },
//       ],
//     };
//   }
// }