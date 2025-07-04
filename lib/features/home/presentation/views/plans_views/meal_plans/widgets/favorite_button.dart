import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/features/home/presentation/views/profile_views/Data/favorites_meals_cubit.dart';

class FavoriteButton extends StatelessWidget {
  final Map<String, dynamic> meal;

  const FavoriteButton({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesMealsCubit, List<Map<String, dynamic>>>(
      builder: (context, favorites) {
        final isFav = favorites.any((item) => item['title'] == meal['title']);
        return GestureDetector(
          onTap: () {
            if (isFav) {
              context.read<FavoritesMealsCubit>().removeFavorite(meal['title']);
            } else {
              context.read<FavoritesMealsCubit>().addFavorite(meal);
            }
          },
          child: Container(
            width: 28,
            height: 28,
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
              ),
            ),
          ),
        );
      },
    );
  }
}
