import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_testing/data_model/cache/favourite_meal.dart';
import 'package:riverpod_testing/mapper/meal_list_mapper.dart';

import '../../../core/network/base_remote_datasource.dart';
import '../app_database.dart';
import 'favourite_post_local_datasource.dart';

final postLocalDataSourceImpl = Provider<MealsLocalDataSourceImpl>((ref) =>
    MealsLocalDataSourceImpl(ref.read(mealMapper), ref.read(databaseService)));

class MealsLocalDataSourceImpl extends BaseRemoteSource
    implements FavouritePostLocalDataSource {
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
  Stream<List<CacheMeal>> getMealsList() {
    return _databaseService.getPostStream();
  }

  @override
  Future<void> insertMealList(List<CacheMeal> postList) {
    return _databaseService.insertPostList(postList);
  }
}
