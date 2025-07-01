import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/features/home/presentation/views/profile_views/Data/favorites_cubit.dart';

class FavoriteButton extends StatelessWidget {
  final Map<String, dynamic> meal;

  const FavoriteButton({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    double boxSize = kWidth(context) * 0.08;
    double iconSize = boxSize * 0.7;
    return BlocBuilder<FavoritesCubit, List<Map<String, dynamic>>>(
      builder: (context, favorites) {
        final isFav = favorites.any((item) => item['title'] == meal['title']);
        return GestureDetector(
          onTap: () {
            if (isFav) {
              context.read<FavoritesCubit>().removeFavorite(meal['title']);
            } else {
              context.read<FavoritesCubit>().addFavorite(meal);
            }
          },
          child: Container(
            width: boxSize,
            height: boxSize,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                8,
              ),
            ),
            child: Center(
              child: Icon(
                isFav ? Icons.favorite : Icons.favorite_border,
                color: isFav ? Colors.red[600] : kPrimaryColor,
                size: iconSize,
              ),
            ),
          ),
        );
      },
    );
  }
}















// // import 'package:flutter/material.dart';
// // import 'package:go_router/go_router.dart';
// // import 'package:h_l_s_application/constants.dart';

// // class FavoriteButton extends StatefulWidget {

  
// //   const FavoriteButton({super.key});

// //   @override
// //   _FavoriteButtonState createState() => _FavoriteButtonState();
// // }

// // class _FavoriteButtonState extends State<FavoriteButton> {
// //   bool isFavorite = false;
  

// //   void toggleFavorite() {
// //     setState(() {
// //       isFavorite = !isFavorite;
// //     });
// //   }

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;

//     double boxSize = screenWidth * 0.08;
//     double iconSize = boxSize * 0.7;

//     return Padding(
//       padding: const EdgeInsets.all(24.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           IconButton(
//             padding: const EdgeInsetsDirectional.all(0),
//             icon: const Icon(
//               Icons.arrow_back,
//               color: Colors.white,
//               size: 28,
//             ),
//             onPressed: () {
//               GoRouter.of(context).pop();
//             },
//           ),
//           const Spacer(),
//           Container(
//               width: boxSize,
//               height: boxSize,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(
//                   8,
//                 ),
//               ),
//               child: Center(
//                 child: Icon(
//                   isFavorite ? Icons.favorite : Icons.favorite_border,
//                   color: isFavorite ? Colors.red[600] : kPrimaryColor,
//                   size: iconSize,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
