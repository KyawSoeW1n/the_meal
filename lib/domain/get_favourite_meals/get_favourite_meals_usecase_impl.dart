import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_meal/data_model/cache/favourite_meal.dart';

import '../../data_source/local/favourite_post/favourite_post_local_datasource_impl.dart';
import 'get_favourite_meals_usecase.dart';

final getFavouriteMealsUseCaseImpl = Provider.autoDispose<GetFavouriteMealsUseCaseImpl>(
    (ref) => GetFavouriteMealsUseCaseImpl(ref.read(postLocalDataSourceImpl)));

class GetFavouriteMealsUseCaseImpl extends GetFavouritePostUseCase {
  final MealsLocalDataSourceImpl _favouriteMealsLocalDataSourceImpl;

  GetFavouriteMealsUseCaseImpl(this._favouriteMealsLocalDataSourceImpl);

  @override
  Stream<List<CacheMeal>> getFavouritePostsList() {
    return _favouriteMealsLocalDataSourceImpl.getMealsList();
  }
}
