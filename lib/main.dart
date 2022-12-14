import 'package:app_culinaria/models/settings.dart';
import 'package:app_culinaria/screens/categories_meals_sceens.dart';
import 'package:app_culinaria/screens/categories_screens.dart';
import 'package:app_culinaria/screens/meal_details_screen.dart';
import 'package:app_culinaria/screens/settings_screen.dart';
import 'package:app_culinaria/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'models/meal.dart';
import 'utils/routes/app_routes.dart';
import './data/dummy_data.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _avaibleMeals = dummyMeals;
  final List<Meal> _favoriteMeals = [];

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  void filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _avaibleMeals = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegararian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegararian;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.pink,
          secondary: Colors.amber,
        ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      routes: {
        AppRoutes.home: (context) => TabsScreen(favoriteMeals: _favoriteMeals),
        AppRoutes.categoriesMeals: (context) => CategoriesMealsScreen(
              meals: _avaibleMeals,
            ),
        AppRoutes.mealDetails: (context) => MealDetailScreen(
              toggleFavorite: _toggleFavorite,
              isFavorite: _isFavorite,
            ),
        AppRoutes.settings: (context) => SettingsScreen(
              filterMeals: filterMeals,
              settings: settings,
            ),
      },
      onUnknownRoute: (settings) {
        // Quando n??o existir rota sera redirecionanda para tela inicial.
        return MaterialPageRoute(
          builder: (_) {
            return const CategoriesScreens();
          },
        );
      },
    );
  }
}
