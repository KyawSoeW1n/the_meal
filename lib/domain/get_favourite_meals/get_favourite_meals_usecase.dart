import 'package:the_meal/data_model/cache/favourite_meal.dart';

abstract class GetFavouritePostUseCase {
  Stream<List<CacheMeal>> getFavouritePostsList();
}
