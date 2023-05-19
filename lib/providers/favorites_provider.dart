import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {

  FavoriteMealsNotifier() : super([]);

  // we must always creat a new object in memory when using StateNotifier
  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      // if meal is favorite, remove it. we must create new list, we can't simply remove it
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      // if meal is not in favorite, add it. we must create a new list
      // we pull out and keep all the existing meals from state (List<Meal)
      // and add the meal to the list.
      state =  [...state, meal];
      return true;
    }
    
  }
}

final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
