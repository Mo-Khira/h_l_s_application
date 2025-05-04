import 'package:flutter/material.dart';

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
    final screenWidth = MediaQuery.of(context).size.width;
    const originalWidth = 302.0;
    final scaleFactor =
        screenWidth < originalWidth ? screenWidth / originalWidth : 1.0;

    return Positioned(
      left: 21,
      top: 556,
      child: Transform.scale(
        scale: scaleFactor,
        alignment: Alignment.topLeft,
        child: SizedBox(
          width: originalWidth,
          height: 184,
          child: Stack(
            children: [
              // Ingredients Title
              const Positioned(
                left: 10,
                top: 0,
                child: Text(
                  'Ingredients',
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 18,
                    color: Color(0xff9eff00),
                    fontFamily: 'Poppins-Medium',
                  ),
                ),
              ),

              // Ingredients List
              Positioned(
                left: 10,
                top: 42,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                      _ingredients
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
                                        originalWidth -
                                        40, // Adjust text wrap width
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontFamily: 'Poppins-Regular',
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
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
        ),
      ),
    );
  }
}
