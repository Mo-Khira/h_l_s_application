import 'package:flutter/material.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/styles.dart';

class PlansSection extends StatelessWidget {
  final String title;
  final VoidCallback onSeeAll;

  const PlansSection({
    super.key,
    required this.title,
    required this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 27,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Styles.textStyle18,
          ),
          GestureDetector(
            onTap: onSeeAll,
            child: Text('See All',
                style: Styles.textStyle16.copyWith(color: kSecondaryColor)),
          ),
        ],
      ),
    );
  }
}
