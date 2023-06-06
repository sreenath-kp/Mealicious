import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/model/meal.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});
