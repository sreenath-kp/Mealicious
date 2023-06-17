import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/model/meal.dart';

class FavouritesNotifier extends StateNotifier<List<Meal>> {
  FavouritesNotifier() : super([]);
  bool toggleFavourites(Meal meal) {
    final isFavourite = state.contains(meal);

    if (isFavourite) {
      state = state.where((element) => element.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      // Get all individual element that already exsist in favourites and add meal to it.
      return true;
    }
  }
}

final favouritesProvider =
    StateNotifierProvider<FavouritesNotifier, List<Meal>>((ref) {
  return FavouritesNotifier();
});
