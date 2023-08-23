import 'package:riverpod_testing/data_model/cache/favourite_meal.dart';

abstract class GetFavouritePostUseCase {
  Stream<List<CacheMeal>> getFavouritePostsList();
}
