import 'package:app_culinaria/components/meal/meal_item.dart';
import 'package:flutter/material.dart';
import '../models/category.dart';
import '../models/meal.dart';

class CategoriesMealsScreen extends StatelessWidget {
  final List<Meal> meals;

  const CategoriesMealsScreen({required this.meals, super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    final categoryMeal = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
          itemCount: categoryMeal.length,
          itemBuilder: (BuildContext context, int index) {
            return MealItem(
              meal: categoryMeal[index],
            );
          }),
    );
  }
}
