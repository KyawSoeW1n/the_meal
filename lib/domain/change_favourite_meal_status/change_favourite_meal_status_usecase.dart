import 'package:riverpod_testing/data_model/cache/favourite_meal.dart';

abstract class ChangeFavouriteMealStatusUseCase {
  Future<void> changePostStatus(CacheMeal cachePost);
}
