import 'package:app_culinaria/components/meal/meal_item.dart';
import 'package:flutter/material.dart';
import '../models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal>? favoriteMeals;
  
  const FavoriteScreen({this.favoriteMeals, super.key});

  @override
  Widget build(BuildContext context) {
    return favoriteMeals!.isEmpty
        ? const Center(
            child: Text('Favoritos'),
          )
        : ListView.builder(
            itemCount: favoriteMeals!.length,
            itemBuilder: (context, index) {
              return MealItem(meal: favoriteMeals![index]);
            },
          );
  }
}
