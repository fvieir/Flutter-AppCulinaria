import 'package:app_culinaria/components/drawer/main_drawer.dart';
import 'package:app_culinaria/screens/categories_screens.dart';
import 'package:app_culinaria/screens/favorite_screen.dart';
import 'package:flutter/material.dart';

import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal>? favoriteMeals;
  
  const TabsScreen({this.favoriteMeals, super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectScreenIndex = 0;

  List<Map<String, Object>>? _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      {'title': 'Categorias', 'screen': const CategoriesScreens()},
      {
        'title': 'Favoritos',
        'screen': FavoriteScreen(
          favoriteMeals: widget.favoriteMeals,
        )
      },
    ];
  }

  void _selectScreen(int index) {
    setState(() {
      _selectScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens![_selectScreenIndex]['title'] as String),
      ),
      drawer: const MainDrawer(),
      body: _screens![_selectScreenIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectScreenIndex,
        onTap: _selectScreen,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_outline),
            label: 'Favoritos',
          )
        ],
      ),
    );
  }
}
