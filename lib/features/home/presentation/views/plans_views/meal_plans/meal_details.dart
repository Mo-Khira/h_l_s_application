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

  // من الباك اند
  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      imagePath: json['imagePath'] ?? 'assets/Images/default.png',
      title: json['title'] ?? 'Unknown',
      calories: json['calories'] ?? '0 kcal',
      cookTime: json['cookTime'] ?? '0 min',
      ingredients: List<String>.from(json['ingredients'] ?? []),
      fat: json['fat'] ?? '0 g',
      protein: json['protein'] ?? '0 g',
      carbs: json['carbs'] ?? '0 g',
      top: (json['top'] ?? 0).toDouble(),
    );
  }
}
