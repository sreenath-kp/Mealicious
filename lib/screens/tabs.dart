import 'package:flutter/material.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/filters_screen.dart';
import 'package:meals/screens/meals_screen.dart';
import 'package:meals/widgets/maindrawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int pageIndex = 0;
  final List<Meal> _favouriteMeals = [];

  Map<String, bool> _filters = {
    'glutenfree': false,
    'lactosefree': false,
    'vegan': false,
    'vegetarian': false,
  };

  void showInfo(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
      ),
    );
  } // show

  void toggleFavourite(Meal meal) {
    final isExisting = _favouriteMeals.contains(meal);
    setState(() {
      if (isExisting) {
        _favouriteMeals.remove(meal);
        showInfo('Removed from favourites');
      } else {
        _favouriteMeals.add(meal);
        showInfo('Added to favourites');
      }
    });
  }

  void _setScreen(String identifier) async {
    if (identifier == 'filters') {
      Navigator.of(context).pop();
      final result =
          await Navigator.of(context).push<Map<String, bool>>(MaterialPageRoute(
              builder: (context) => FilterScreen(
                    currentFilters: _filters,
                  )));
      setState(() {
        _filters = result ?? _filters;
      });
    } else {
      Navigator.of(context).pushReplacementNamed('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredMeals = dummyMeals.where((meal) {
      if (_filters['glutenfree']! && !meal.isGlutenFree) {
        return false;
      }
      if (_filters['lactosefree']! && !meal.isLactoseFree) {
        return false;
      }
      if (_filters['vegan']! && !meal.isVegan) {
        return false;
      }
      if (_filters['vegetarian']! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
    String activeTitle = 'Categories';
    Widget activeScreen = CategoryScreen(
      toggleFavourite: toggleFavourite,
      availableMeals: filteredMeals,
    );
    if (pageIndex == 1) {
      activeTitle = 'Favourites';
      activeScreen = MealsScreen(
        meals: _favouriteMeals,
        toggleFavourite: toggleFavourite,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          activeTitle,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).colorScheme.primary,
          currentIndex: pageIndex,
          onTap: (index) {
            setState(() {
              pageIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
          ]),
    );
  }
}
