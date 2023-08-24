import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:the_meal/app_constants/api_routes.dart';
import 'package:the_meal/data_model/cache/favourite_meal.dart';
import 'package:the_meal/data_model/response/meal_categories.dart';
import 'package:the_meal/data_model/response/meal_list_response.dart';
import 'package:the_meal/data_source/network/meals/meals_remote_datasource.dart';
import 'package:the_meal/mapper/meal_categoryies_mapper.dart';
import 'package:the_meal/mapper/meal_list_mapper.dart';

import '../../../app_constants/app_constants.dart';
import '../../../core/network/base_remote_datasource.dart';
import '../../../data_model/vo/meal_category_vo.dart';

final mealsRemoteDataSourceImpl =
    Provider.autoDispose<MealsRemoteDataSourceImpl>(
        (ref) => MealsRemoteDataSourceImpl(
              ref.watch(mealMapper),
              ref.watch(mealCategoriesMapper),
            ));

class MealsRemoteDataSourceImpl extends BaseRemoteSource
    implements MealsRemoteDataSource {
  final MealsMapper _mealsMapper;
  final MealCategoriesMapper _mealCategoriesMapper;

  MealsRemoteDataSourceImpl(
    this._mealsMapper,
    this._mealCategoriesMapper,
  );

  @override
  Future<List<CacheMeal>> getMealList(String categoryName) async {
    try {
      final endpoint =
          "${AppConstants.baseUrl}${ApiRoutes.getMealsListByeCategory}";
      return callApiWithErrorParser(() =>
              dioClient.get(endpoint, queryParameters: {"c": categoryName}))
          .then((response) {
        return _mealsMapper
            .mapFromResponse(MealListResponse.fromJson(response.data));
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MealCategoryVO>> getMealCategories() {
    try {
      final endpoint = "${AppConstants.baseUrl}${ApiRoutes.getCategories}";
      return callApiWithErrorParser(() => dioClient.get(endpoint))
          .then((response) {
        return _mealCategoriesMapper
            .mapFromResponse(MealCategories.fromJson(response.data));
      });
    } catch (e) {
      rethrow;
    }
  }
}
