import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_l_s_application/features/home/presentation/views/profile_views/Data/favorites_workouts_cubit.dart';

class FavoriteWorkoutButton extends StatelessWidget {
  final Map<String, dynamic> workout;

  const FavoriteWorkoutButton({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesWorkoutCubit, List<Map<String, dynamic>>>(
      builder: (context, favorites) {
        final isFav =
            context.read<FavoritesWorkoutCubit>().isFavorite(workout['title']);
        return GestureDetector(
          onTap: () {
            context.read<FavoritesWorkoutCubit>().toggleFavorite(workout);
          },
          child: Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Icon(
                isFav ? Icons.favorite : Icons.favorite_border,
                color: isFav ? Colors.red : Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }
}
