// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_login_button.dart';
import 'package:h_l_s_application/features/home/presentation/views/Diary_view/widgets/custom_build_calendar.dart';
import 'package:h_l_s_application/features/home/presentation/views/Diary_view/widgets/meal_selection_widget.dart';
import 'package:h_l_s_application/features/home/presentation/views/plans_views/meal_plans/meal_details.dart';
import 'package:h_l_s_application/features/home/presentation/views/plans_views/meal_plans/meal_list.dart';
import 'package:h_l_s_application/features/home/presentation/views/plans_views/training_plans/training_list.dart';

class DiaryView extends StatefulWidget {
  const DiaryView({super.key});

  @override
  State<DiaryView> createState() => _DiaryViewState();
}

class _DiaryViewState extends State<DiaryView> {
  List<Meal> allMeals = getStaticMeals();
  List<Map<String, dynamic>> allWorkouts = getTrainingPlans();

  Set<String> selectedMealTitles = {}; // لتجنب التكرار
  Set<String> selectedWorkoutTitles = {};

  int selectionCount = 0;

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay.now();

  bool isReminderOn = true;

  void _onDateSelected(DateTime newDate) {
    setState(() => selectedDate = newDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: fetchData(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              final data =
                  snapshot.data as Map<String, List<Map<String, dynamic>>>;
              return SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    SizedBox(height: kHeight(context) * 0.08),
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
                              "816",
                              style: Styles.textStyle16,
                            ),
                            Text(
                              "=",
                              style: Styles.textStyle16,
                            ),
                            Text(
                              "1684",
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
                        MealSelectionWidget(
                            title: "Breakfast", items: data['meals']!),
                        MealSelectionWidget(
                            title: "Lunch", items: data['meals']!),
                        MealSelectionWidget(
                            title: "Dinner", items: data['meals']!),
                        const SizedBox(height: 65),
                        MealSelectionWidget(
                          title: "Add Exercise",
                          items: data['exercises']!,
                          isExercise: true,
                        ),
                      ],
                    ),
                    SizedBox(height: kHeight(context) * 0.04),
                    CustomLoginButton(text: "Complete Diary"),
                    const SizedBox(height: 20),
                  ],
                ),
              ));
            }),
      ),
    );
  }

  Future<Map<String, List<Map<String, dynamic>>>> fetchData() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return {
      'meals': [
        {
          'name': 'Grilled Chicken',
          'calories': 300,
          'protein': 25,
          'carbs': 10,
        },
        {
          'name': 'Oatmeal',
          'calories': 200,
          'protein': 6,
          'carbs': 35,
        },
        {
          'name': 'Salad',
          'calories': 120,
          'protein': 4,
          'carbs': 10,
        },
      ],
      'exercises': [
        {'name': 'Running', 'duration': 30},
        {'name': 'Cycling', 'duration': 45},
        {'name': 'Yoga', 'duration': 60},
      ],
    };
  }
}





                        // ExpansionTile(
                        //   title: Text("Breakfast"),
                        //   children: allMeals
                        //       .where((meal) =>
                        //           !selectedMealTitles.contains(meal.title))
                        //       .map((meal) => ListTile(
                        //             leading:
                        //                 Image.asset(meal.imagePath, width: 40),
                        //             title: Text(meal.title),
                        //             subtitle: Text(
                        //                 "Calories: ${meal.calories}, Protein: ${meal.protein}, Carbs: ${meal.carbs}"),
                        //             onTap: () {
                        //               setState(() {
                        //                 selectedMealTitles.add(meal.title);
                        //                 selectionCount++;
                        //               });
                        //             },
                        //           ))
                        //       .toList(),
                        // ),
                        // ExpansionTile(
                        //   title: Text("Lunch"),
                        //   children: allMeals
                        //       .where((meal) =>
                        //           !selectedMealTitles.contains(meal.title))
                        //       .map((meal) => ListTile(
                        //             leading:
                        //                 Image.asset(meal.imagePath, width: 40),
                        //             title: Text(meal.title),
                        //             subtitle: Text(
                        //                 "Calories: ${meal.calories}, Protein: ${meal.protein}, Carbs: ${meal.carbs}"),
                        //             onTap: () {
                        //               setState(() {
                        //                 selectedMealTitles.add(meal.title);
                        //                 selectionCount++;
                        //               });
                        //             },
                        //           ))
                        //       .toList(),
                        // ),
                        // ExpansionTile(
                        //   title: Text("Dinner"),
                        //   children: allMeals
                        //       .where((meal) =>
                        //           !selectedMealTitles.contains(meal.title))
                        //       .map((meal) => ListTile(
                        //             leading:
                        //                 Image.asset(meal.imagePath, width: 40),
                        //             title: Text(meal.title),
                        //             subtitle: Text(
                        //                 "Calories: ${meal.calories}, Protein: ${meal.protein}, Carbs: ${meal.carbs}"),
                        //             onTap: () {
                        //               setState(() {
                        //                 selectedMealTitles.add(meal.title);
                        //                 selectionCount++;
                        //               });
                        //             },
                        //           ))
                        //       .toList(),
                        // ),
                        // ExpansionTile(
                        //   title: Text("Add Exercise"),
                        //   children: allWorkouts
                        //       .where((workout) => !selectedWorkoutTitles
                        //           .contains(workout['title']))
                        //       .map((workout) => ListTile(
                        //             leading: Image.asset(workout['cardImage'],
                        //                 width: 40),
                        //             title: Text(workout['title']),
                        //             subtitle: Text(workout['subtitle']),
                        //             onTap: () {
                        //               setState(() {
                        //                 selectedWorkoutTitles
                        //                     .add(workout['title']);
                        //                 selectionCount++;
                        //               });
                        //             },
                        //           ))
                        //       .toList(),
                        // )

// import 'package:flutter/material.dart';
// import 'package:h_l_s_application/constants.dart';
// import 'package:h_l_s_application/core/utils/assets.dart';
// import 'package:h_l_s_application/core/utils/styles.dart';
// import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_login_button.dart';
// import 'package:h_l_s_application/features/home/presentation/views/Diary_view/widgets/custom_build_calendar.dart';
// import 'package:h_l_s_application/features/home/presentation/views/Diary_view/widgets/meal_selection_widget.dart';

// class DiaryView extends StatefulWidget {
//   const DiaryView({super.key});

//   @override
//   State<DiaryView> createState() => _DiaryViewState();
// }

// class _DiaryViewState extends State<DiaryView> {
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
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: Column(
//               children: [
//                 SizedBox(height: kHeight(context) * 0.08),
//                 CustomBuildCalendar(
//                   // onDateSelected: (DateTime) {},
//                   onDateSelected: _onDateSelected,
//                   selectedDate: selectedDate,
//                 ), // Custom calendar widget
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Calories Remaining",
//                       style: Styles.textStyle14,
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Text(
//                           "2500",
//                           style: Styles.textStyle16,
//                         ),
//                         Text(
//                           "-",
//                           style: Styles.textStyle16,
//                         ),
//                         Text(
//                           "816",
//                           style: Styles.textStyle16,
//                         ),
//                         Text(
//                           "=",
//                           style: Styles.textStyle16,
//                         ),
//                         Text(
//                           "1684",
//                           style: Styles.textStyle16,
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Text(
//                           "    Goal  ",
//                           style: Styles.textStyle14,
//                         ),
//                         Text(
//                           "     Food",
//                           style: Styles.textStyle14,
//                         ),
//                         Text(
//                           "Remaining",
//                           style: Styles.textStyle14,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),

//                 const SizedBox(
//                   height: 30,
//                 ),
//                 Column(
//                   children: [
//                     MealSelectionWidget(
//                       title: "Breakfast",
//                       imagePath: "assets/Images/img (5).png",
//                       onTap: () {},
//                     ),
//                     const SizedBox(height: 20),
//                     MealSelectionWidget(
//                       title: "Lunch",
//                       imagePath: "assets/Images/Curry Salmon 3.png",
//                       onTap: () {},
//                     ),
//                     const SizedBox(height: 20),
//                     MealSelectionWidget(
//                       title: "Dinner",
//                       imagePath: "assets/Images/img (4).png",
//                       onTap: () {},
//                     ),
//                     const SizedBox(height: 70),
//                     MealSelectionWidget(
//                       title: "Add Exercise",
//                       imagePath: AssetsData.screen3,
//                       onTap: () {},
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: kHeight(context) * 0.04),
//                 CustomLoginButton(text: "Complete Diary"),
//                 const SizedBox(height: 20),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
