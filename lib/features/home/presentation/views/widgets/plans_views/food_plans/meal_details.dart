class Meal {
  final String imagePath;
  final String title;
  final String calories;
  final String cookTime;
  final List<String> ingredients;
  final String fat;
  final String protein;
  final String carbs;
  final double top;

  Meal({
    required this.imagePath,
    required this.title,
    required this.calories,
    required this.cookTime,
    required this.ingredients,
    required this.fat,
    required this.protein,
    required this.carbs,
    required this.top,
  });
}
