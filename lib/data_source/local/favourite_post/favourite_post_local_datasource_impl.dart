import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_meal/data_model/cache/favourite_meal.dart';
import 'package:the_meal/mapper/meal_list_mapper.dart';

import '../../../core/network/base_remote_datasource.dart';
import '../app_database.dart';
import 'favourite_post_local_datasource.dart';

final postLocalDataSourceImpl = Provider<MealsLocalDataSourceImpl>((ref) =>
    MealsLocalDataSourceImpl(ref.read(mealMapper), ref.read(databaseService)));

class MealsLocalDataSourceImpl extends BaseRemoteSource
    implements FavouriteMealLocalDataSource {
  final MealsMapper postMapper;
  final DatabaseService _databaseService;

  MealsLocalDataSourceImpl(
    this.postMapper,
    this._databaseService,
  );

  @override
  Future<void> addFavouriteMeal(CacheMeal cachePost) async {
    _databaseService.changePostStatus(cachePost);
  }

  @override
  Stream<List<CacheMeal>> getMealsList(String categoryName) {
    return _databaseService.getMealStream(categoryName);
  }

  @override
  Future<void> insertMealList(List<CacheMeal> postList) {
    return _databaseService.insertPostList(postList);
  }

  @override
  Stream<List<CacheMeal>> getFavouriteMeal() {
    return _databaseService.getFavouriteMealListStream();
  }
}
