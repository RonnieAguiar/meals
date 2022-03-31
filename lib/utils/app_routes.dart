import 'package:flutter/material.dart';
import 'package:meals/screens/tabs_screen.dart';

import '../screens/categories_meals_screen.dart';
import '../screens/categories_screen.dart';
import '../screens/tabs_screen.dart';
import '../screens/meal_detail_screen.dart';
import '../screens/settings_screen.dart';

class AppRoutes {
  static const home = '/';
  static const categoryMeals = '/categories-meals';
  static const mealDetail = '/meal-detail';
  static const settings = '/settings';
}

var myRoutes = {
  AppRoutes.home: (context) => const TabsScreen(),
  AppRoutes.categoryMeals: (context) => const CategoriesMealsScreen(),
  AppRoutes.mealDetail: (context) => const MealDetailScreen(),
  AppRoutes.settings: (context) => const SettingsScreen(),
};

MaterialPageRoute routeUnknown(settings) {
  return MaterialPageRoute(
    builder: (_) => const CategoriesScreen(),
  );
}
