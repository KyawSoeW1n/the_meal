import 'package:the_meal/data_model/cache/favourite_meal.dart';

abstract class ChangeFavouriteMealStatusUseCase {
  Future<void> changePostStatus(CacheMeal cachePost);
}
