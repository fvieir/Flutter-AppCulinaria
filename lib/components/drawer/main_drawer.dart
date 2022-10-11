import 'package:app_culinaria/utils/routes/app_routes.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  _createItem(IconData icon, String title, void Function() onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).colorScheme.secondary,
            alignment: Alignment.bottomCenter,
            child: Text(
              'Vamos Cozinhar ?',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(height: 20),
          _createItem(
            Icons.restaurant,
            'Refeições',
            () => Navigator.of(context).pushNamed(AppRoutes.home),
          ),
          _createItem(
            Icons.settings,
            'Configurações',
            () => Navigator.of(context).pushNamed(AppRoutes.settings),
          ),
        ],
      ),
    );
  }
}
