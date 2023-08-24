import 'package:the_meal/data_model/cache/favourite_meal.dart';

abstract class FavouriteMealLocalDataSource {
  Stream<List<CacheMeal>> getMealsList(String categoryName);

  Stream<List<CacheMeal>> getFavouriteMeal();

  Future<void> addFavouriteMeal(CacheMeal cachePost);

  Future<void> insertMealList(List<CacheMeal> postList);
}
