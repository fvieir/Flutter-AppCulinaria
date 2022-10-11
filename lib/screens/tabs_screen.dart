import 'package:app_culinaria/screens/categories_screens.dart';
import 'package:app_culinaria/screens/favorite_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Vamor cozinhar ?'),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categorias',
              ),
              Tab(
                icon: Icon(Icons.star_border),
                text: 'Favoritos',
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CategoriesScreens(),
            FavoriteScreen(),
          ],
        ),
      ),
    );
  }
}
