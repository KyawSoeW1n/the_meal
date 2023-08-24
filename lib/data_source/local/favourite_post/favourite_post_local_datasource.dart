import 'package:the_meal/data_model/cache/favourite_meal.dart';

abstract class FavouritePostLocalDataSource {
  Stream<List<CacheMeal>> getMealsList();

  Future<void> addFavouriteMeal(CacheMeal cachePost);

  Future<void> insertMealList(List<CacheMeal> postList);
}
