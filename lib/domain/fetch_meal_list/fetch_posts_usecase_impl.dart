import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_meal/data_source/local/favourite_post/favourite_post_local_datasource_impl.dart';
import 'package:the_meal/data_source/network/meals/meals_remote_datasource_impl.dart';

import 'fetch_posts_usecase.dart';

final fetchMealListUseCaseImpl = Provider.autoDispose<FetchMealListUseCaseImpl>(
  (ref) => FetchMealListUseCaseImpl(
    ref.watch(mealsRemoteDataSourceImpl),
    ref.watch(postLocalDataSourceImpl),
  ),
);

class FetchMealListUseCaseImpl extends FetchMealListPostUseCase {
  final MealsRemoteDataSourceImpl _mealsRemoteDataSourceImpl;
  final MealsLocalDataSourceImpl _mealsLocalDataSourceImpl;

  FetchMealListUseCaseImpl(
    this._mealsRemoteDataSourceImpl,
    this._mealsLocalDataSourceImpl,
  );

  @override
  Future<void> fetchMealList(String categoryName) async {
    try {
      final mealList = await _mealsRemoteDataSourceImpl.getMealList(categoryName);
      _mealsLocalDataSourceImpl.insertMealList(mealList);
    } catch (e) {
      rethrow;
    }
  }
}
