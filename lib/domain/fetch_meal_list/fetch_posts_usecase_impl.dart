import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_testing/data_source/local/favourite_post/favourite_post_local_datasource_impl.dart';
import 'package:riverpod_testing/data_source/network/meals/meals_remote_datasource_impl.dart';

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
  Future<void> fetchMealList() async {
    try {
      final postList = await _mealsRemoteDataSourceImpl.getMealList();
      _mealsLocalDataSourceImpl.insertMealList(postList);
    } catch (e) {
      rethrow;
    }
  }
}
