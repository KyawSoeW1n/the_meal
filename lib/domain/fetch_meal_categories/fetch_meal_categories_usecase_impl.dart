import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_testing/data_source/local/favourite_post/favourite_post_local_datasource_impl.dart';
import 'package:riverpod_testing/data_source/network/meals/meals_remote_datasource_impl.dart';

import '../../data_model/vo/meal_category_vo.dart';
import '../fetch_meal_list/fetch_posts_usecase_impl.dart';
import 'fetch_meal_categories_usecase.dart';

final fetchMealCategoriesUseCaseImpl = Provider.autoDispose<FetchMealCategoriesUseCaseImpl>(
  (ref) => FetchMealCategoriesUseCaseImpl(
    ref.watch(mealsRemoteDataSourceImpl),
  ),
);

class FetchMealCategoriesUseCaseImpl extends FetchMealCategoriesUseCase {
  final MealsRemoteDataSourceImpl _mealsRemoteDataSourceImpl;

  FetchMealCategoriesUseCaseImpl(
    this._mealsRemoteDataSourceImpl,
  );

  @override
  Future<List<MealCategoryVO>> fetchMealCategories() async {
    try {
      final postList = await _mealsRemoteDataSourceImpl.getMealCategories();
      return postList;
    } catch (e) {
      rethrow;
    }
  }
}
