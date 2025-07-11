import 'package:h_l_s_application/features/home/presentation/views/plans_views/meal_plans/meal_details.dart';

List<Meal> getStaticMeals() {
  return [
    Meal(
      imagePath: 'assets/Images/img (3).png',
      title: 'Green beans, tomatoes, eggs',
      calories: '235 kcal',
      cookTime: '5 min',
      ingredients: [
        '2-3 eggs',
        'A handful of fresh spinach',
        '1 small tomato',
        'Salt and pepper to taste',
        'Olive oil or butter',
      ],
      fat: '1.5 g',
      protein: '10.9 g',
      carbs: '13.5 g',
      top: 181,
    ),
    Meal(
      imagePath: 'assets/Images/img (4).png',
      title: 'Greek salad with lettuce, green onion',
      calories: '250 kcal',
      cookTime: '5 min',
      ingredients: [
        'Cheese',
        'A handful of fresh spinach',
        'Salt and pepper to taste',
        'Olive oil or butter',
      ],
      fat: '1.5 g',
      protein: '10.9 g',
      carbs: '13.5 g',
      top: 285,
    ),
    Meal(
      imagePath: 'assets/Images/img (5).png',
      title: 'Salad of fresh vegetables',
      calories: '270 kcal',
      cookTime: '5 min',
      ingredients: [
        'Onion',
        'A handful of fresh spinach',
        '1 small tomato',
        'Salt and pepper to taste',
        'Olive oil or butter',
      ],
      fat: '1.5 g',
      protein: '10.9 g',
      carbs: '13.5 g',
      top: 389,
    ),
    Meal(
      imagePath: 'assets/Images/avocado.png',
      title: 'Avocado Dish',
      calories: '240 kcal',
      cookTime: '6 min',
      ingredients: ['Avocado', 'Spices'],
      fat: '1.5 g',
      protein: '10.9 g',
      carbs: '13.5 g',
      top: 493,
    ),
    Meal(
      imagePath: 'assets/Images/sNAKS 1.png',
      title: 'Healthy Snacks',
      calories: '330 kcal',
      cookTime: '7 min',
      ingredients: ['apple', 'Strawberry', 'Green Peas', 'banana', 'nuts'],
      fat: '1.5 g',
      protein: '10.9 g',
      carbs: '13.5 g',
      top: 597,
    ),
    Meal(
      imagePath: 'assets/Images/Curry Salmon 3.png',
      title: 'Curry salmon',
      calories: '476 kcal',
      cookTime: '10 min',
      ingredients: ['Salmon', 'Curry', 'Spices'],
      fat: '1.5 g',
      protein: '10.9 g',
      carbs: '13.5 g',
      top: 701,
    ),
  ];
}

List<Meal> parseMealsFromBackend(List<dynamic> data) {
  return data.map((item) => Meal.fromJson(item)).toList();
}
