import 'package:flutter/material.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/styles.dart';

class MealSelectionWidget extends StatefulWidget {
  final String title;
  final List<Map<String, dynamic>> items;
  final bool isExercise;

  const MealSelectionWidget({
    super.key,
    required this.title,
    required this.items,
    this.isExercise = false,
  });

  @override
  State<MealSelectionWidget> createState() => _MealSelectionWidgetState();
}

class _MealSelectionWidgetState extends State<MealSelectionWidget> {
  bool isExpanded = false;
  final List<Map<String, dynamic>> selectedItems = [];

  void toggleExpanded() => setState(() => isExpanded = !isExpanded);

  void toggleSelection(Map<String, dynamic> item) {
    setState(() {
      if (selectedItems.contains(item)) {
        selectedItems.remove(item);
      } else {
        selectedItems.add(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: toggleExpanded,
          child: Container(
            width: kWidth(context),
            height: kHeight(context) * 0.09,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white.withOpacity(0.95),
              border: Border.all(color: kSecondaryColor),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: Styles.textStyle18.copyWith(color: kPrimaryColor),
                  ),
                  Icon(isExpanded ? Icons.expand_less : Icons.expand_more,
                      color: kPrimaryColor),
                ],
              ),
            ),
          ),
        ),
        if (isExpanded)
          Column(
            children: widget.items.map((item) {
              final isSelected = selectedItems.contains(item);
              return ListTile(
                title: Text(
                  item['name'],
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  widget.isExercise
                      ? "Duration: ${item['duration']} min"
                      : "Calories: ${item['calories']} | Protein: ${item['protein']}g | Carbs: ${item['carbs']}g",
                  style: TextStyle(color: Colors.grey[400], fontSize: 13),
                ),
                trailing: Icon(
                  isSelected ? Icons.check_circle : Icons.circle_outlined,
                  color: isSelected ? Colors.green : Colors.grey,
                ),
                onTap: () => toggleSelection(item),
              );
            }).toList(),
          ),
        if (selectedItems.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Wrap(
              children: selectedItems
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Chip(
                          label: Text(
                            e['name'],
                            style: Styles.textStyle12.copyWith(color: kPrimaryColor),
                          ),
                          backgroundColor: kSecondaryColor,
                        ),
                      ))
                  .toList(),
            ),
          ),
        const SizedBox(height: 10),
      ],
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:h_l_s_application/constants.dart';
// import 'package:h_l_s_application/core/utils/styles.dart';

// class MealSelectionWidget extends StatelessWidget {
//   final String title;
//   final String imagePath;
//   final VoidCallback? onTap;

//   const MealSelectionWidget({
//     super.key,
//     required this.title,
//     required this.imagePath,
//     this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         GestureDetector(
//           onTap: onTap,
//           child: Stack(
//             alignment: Alignment.center,
//             children: [
//               Container(
//                 width: kWidth(context),
//                 height: kHeight(context) * 0.09,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(16),
//                   image: DecorationImage(
//                     image: AssetImage(imagePath),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               Container(
//                 height: kHeight(context) * 0.09,
//                 decoration: BoxDecoration(
//                   color: Colors.white.withValues(alpha: 0.8),
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 18),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(title,
//                         style:
//                             Styles.textStyle18.copyWith(color: kPrimaryColor)),
//                     Container(
//                       width: kWidth(context) * 0.08,
//                       height: kWidth(context) * 0.08,
//                       decoration: const BoxDecoration(
//                         color: kSecondaryColor,
//                         shape: BoxShape.circle,
//                       ),
//                       child: Icon(
//                         Icons.add,
//                         color: kPrimaryColor,
//                         size: kWidth(context) * 0.05,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(height: kHeight(context) * 0.01),
//       ],
//     );
//   }
// }
