import 'package:flutter/material.dart';

import '../screens/categories_meals_screen.dart';
import '../screens/categories_screen.dart';
import '../screens/meal_detail_screen.dart';

class AppRoutes {
  static const home = '/';
  static const categoryMeals = '/categories-meals';
  static const mealDetail = '/meal-detail';
}

var myRoutes = {
  AppRoutes.home: (context) => const CategoriesScreen(),
  AppRoutes.categoryMeals: (context) => const CategoriesMealsScreen(),
  AppRoutes.mealDetail: (context) => const MealDetailScreen(),
};

MaterialPageRoute routeUnknown(settings) {
  return MaterialPageRoute(
    builder: (_) => const CategoriesScreen(),
  );
}
