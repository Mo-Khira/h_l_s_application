import 'package:flutter/material.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/styles.dart';

class IngredientsSection extends StatefulWidget {
  final List<String> ingredients; // Dynamic ingredients data

  const IngredientsSection({super.key, required this.ingredients});

  @override
  _IngredientsSectionState createState() => _IngredientsSectionState();
}

class _IngredientsSectionState extends State<IngredientsSection> {
  late List<String> _ingredients;

  @override
  void initState() {
    super.initState();
    _ingredients = widget.ingredients;
  }

  @override
  void didUpdateWidget(covariant IngredientsSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.ingredients != widget.ingredients) {
      setState(() {
        _ingredients = widget.ingredients;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kWidth(context),
      height: 184,
      child: Stack(
        children: [
          // Ingredients Title
          Positioned(
            left: 10,
            top: 0,
            child: Text('Ingredients',
                style: Styles.textStyle18.copyWith(color: kSecondaryColor)),
          ),

          // Ingredients List
          Positioned(
            left: 10,
            top: 42,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _ingredients
                  .map(
                    (item) => Padding(
                      padding: const EdgeInsets.only(bottom: 7.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 5,
                            height: 5,
                            margin: const EdgeInsets.only(
                              top: 6,
                              right: 8,
                            ),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width:
                                kWidth(context) - 40, // Adjust text wrap width
                            child: Text(item, style: Styles.textStyle16),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
