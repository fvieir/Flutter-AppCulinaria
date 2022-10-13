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
  final List<Meal> _avaibleMeals = dummyMeals;

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
        AppRoutes.home: (context) => const TabsScreen(),
        AppRoutes.categoriesMeals: (context) => CategoriesMealsScreen(
              meals: _avaibleMeals,
            ),
        AppRoutes.mealDetails: (context) => const MealDetailScreen(),
        AppRoutes.settings: (context) => const SettingsScreen(),
      },
      onUnknownRoute: (settings) {
        // Quando não existir rota sera redirecionanda para tela inicial.
        return MaterialPageRoute(
          builder: (_) {
            return const CategoriesScreens();
          },
        );
      },
    );
  }
}
