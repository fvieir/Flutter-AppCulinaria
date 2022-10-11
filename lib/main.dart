import 'package:app_culinaria/screens/categories_meals_sceens.dart';
import 'package:app_culinaria/screens/categories_screens.dart';
import 'package:app_culinaria/screens/meal_details_screen.dart';
import 'package:app_culinaria/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'utils/routes/app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        AppRoutes.categoriesMeals: (context) => const CategoriesMealsScreen(),
        AppRoutes.mealDetails: (context) => const MealDetailScreen(),
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
