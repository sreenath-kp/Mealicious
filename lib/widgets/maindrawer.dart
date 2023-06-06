import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Icon(Icons.fastfood_sharp,
                    size: 50, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 30),
                Text(
                  'Meals App',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w900,
                      ),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              // Navigator.of(context).pushReplacementNamed('/');
              onSelectScreen('meals');
            },
            leading: const Icon(Icons.restaurant),
            title: Text(
              'Meals',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ),
          ListTile(
            onTap: () {
              onSelectScreen('filters');
            },
            leading: const Icon(Icons.settings),
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ),
          ListTile(
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'Meals App',
                applicationVersion: '1.0.0',
                applicationIcon: Icon(Icons.fastfood_sharp,
                    size: 50, color: Theme.of(context).colorScheme.primary),
                children: [
                  Text(
                    'This app is developed by',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Sreenath K P',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                ],
              );
            },
            leading: const Icon(Icons.info),
            title: Text(
              'About',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
