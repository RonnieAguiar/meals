import 'package:flutter/material.dart';

import '../data/dammy_data.dart';
import '../models/meal.dart';
import '../screens/categories_meals_screen.dart';
import '../screens/categories_screen.dart';
import '../screens/tabs_screen.dart';
import '../screens/meal_detail_screen.dart';
import '../screens/settings_screen.dart';
import 'models/settings.dart';
import 'utils/app_routes.dart';

void main() => runApp(const MyApp());

List<Meal> _availableMeals = dummyMeal;

MaterialPageRoute routeUnknown(settings) {
  return MaterialPageRoute(
    builder: (_) => const CategoriesScreen(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void _filterMeals(Settings settings) {
    setState(() {
      _availableMeals = dummyMeal.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !filterGluten &&
            !filterLactose &&
            filterVegan &&
            filterVegetarian;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {

    var myRoutes = {
      AppRoutes.home: (context) => const TabsScreen(),
      AppRoutes.categoryMeals: (context) =>
          CategoriesMealsScreen(_availableMeals),
      AppRoutes.mealDetail: (context) => const MealDetailScreen(),
      AppRoutes.settings: (context) => SettingsScreen(_filterMeals),
    };

    return MaterialApp(
      title: 'Vamos cozinhar?',
      theme: ThemeData(
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
        ).copyWith(secondary: Colors.amber),
        fontFamily: 'Releway',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: const TextStyle(
                fontSize: 16,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      routes: myRoutes,
      onUnknownRoute: routeUnknown,
    );
  }
}
