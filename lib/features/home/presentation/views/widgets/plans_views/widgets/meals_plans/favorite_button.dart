import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  // Define a boolean to track the favorite state
  bool isFavorite = false;

  // Function to toggle favorite state
  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get screen width and height using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;

    // Calculate responsive positioning and size
    double boxSize = screenWidth * 0.08; // 8% of the screen width for box size
    double iconSize = boxSize * 0.7; // Icon size is 70% of the box size

    return Positioned(
      left: 378, // Set to 378 as per the new position
      top: 28, // Set to 28 as per the new position
      child: GestureDetector(
        onTap: toggleFavorite,
        child: Container(
          width: boxSize,
          height: boxSize,
          decoration: BoxDecoration(
            color: Colors.white, // Set the background color of the box to white
            borderRadius: BorderRadius.circular(
              8,
            ), // Optional: rounded corners for the box
          ),
          child: Center(
            child: Icon(
              isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border, // Filled or empty heart
              color: isFavorite
                  ? Color(0xFFCF1C38) // Heart color when favorite
                  : const Color.fromARGB(
                      255,
                      5,
                      5,
                      5,
                    ), // Heart color when not favorite
              size: iconSize, // Adjust icon size responsively
            ),
          ),
        ),
      ),
    );
  }
}
