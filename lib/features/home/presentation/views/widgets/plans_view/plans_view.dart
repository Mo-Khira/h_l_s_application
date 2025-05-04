// import 'package:flutter/material.dart';
// import 'package:h_l_s_application/features/home/presentation/views/widgets/plans_view/widgets/meal_card.dart';
// import 'package:h_l_s_application/features/home/presentation/views/widgets/plans_view/widgets/training_card_item.dart';

// class PlansView extends StatelessWidget {
//   const PlansView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final List<Map<String, String>> meals = [
//       {
//         "image": "assets/Images/img.png",
//         "title": "Fried eggs, salmon",
//         "calories": "135 kcal"
//       },
//       {
//         "image": "assets/Images/img (1).png",
//         "title": "Greek salad with lettuce",
//         "calories": "150 kcal"
//       },
//       {
//         "image": "assets/Images/img (2).png",
//         "title": "Salad of fresh vegetables",
//         "calories": "270 kcal"
//       },
//     ];

//     return Scaffold(
//       backgroundColor: const Color(0xff161515),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 22),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Back Button
//               Padding(
//                 padding: const EdgeInsets.only(top: 20),
//                 child: GestureDetector(
//                   onTap: () => Navigator.pop(context),
//                   child: Image.asset(
//                     'assets/Images/arrow_left_alt.png',
//                     width: 32,
//                     height: 32,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Meal Plans Section
//               PlansSection(
//                 title: 'Meal Plans',
//                 onSeeAll: () {
//                   print('See All Meals clicked!');
//                 },
//               ),
//               const SizedBox(height: 16),

//               // Meal List
//               Expanded(
//                 child: ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: meals.length,
//                   itemBuilder: (context, index) {
//                     final meal = meals[index];
//                     return MealCard(
//                       image: meal["image"]!,
//                       title: meal["title"]!,
//                       calories: meal["calories"]!,
//                     );
//                   },
//                 ),
//               ),

//               const SizedBox(height: 20),

//               // Training Plans Section
//               PlansSection(
//                 title: 'Training Plans',
//                 onSeeAll: () {
//                   print('See All Training clicked!');
//                 },
//               ),
//               const SizedBox(height: 16),

//               // Training Card List
//               const Expanded(
//                 child: TrainingCardList(),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Reusable PlansSection Widget
// class PlansSection extends StatelessWidget {
//   final String title;
//   final VoidCallback onSeeAll;

//   const PlansSection({
//     Key? key,
//     required this.title,
//     required this.onSeeAll,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       height: 27,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             title,
//             style: const TextStyle(
//               fontSize: 18,
//               color: Colors.white,
//               fontFamily: 'Poppins-SemiBold',
//             ),
//           ),
//           GestureDetector(
//             onTap: onSeeAll,
//             child: const Text(
//               'See All',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Color(0xff9eff00),
//                 fontFamily: 'Poppins-Medium',
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
