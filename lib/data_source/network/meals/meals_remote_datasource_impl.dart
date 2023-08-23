import 'dart:convert';
import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_testing/app_constants/api_routes.dart';
import 'package:riverpod_testing/data_model/cache/favourite_meal.dart';
import 'package:riverpod_testing/data_model/response/meal_categories.dart';
import 'package:riverpod_testing/data_source/network/meals/meals_remote_datasource.dart';
import 'package:riverpod_testing/mapper/meal_categoryies_mapper.dart';
import 'package:riverpod_testing/mapper/meal_list_mapper.dart';

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
  Future<List<CacheMeal>> getMealList() async {
    try {
      final endpoint =
          "${AppConstants.baseUrl}${ApiRoutes.getMealsListByeCategory}";
      return callApiWithErrorParser(() =>
              dioClient.get(endpoint, queryParameters: {"c": "Breakfast"}))
          .then((response) {
        return _mealsMapper.mapFromResponse(response.data);
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
        return _mealCategoriesMapper.mapFromResponse(MealCategories.fromJson(response.data));
      });
    } catch (e) {
      rethrow;
    }
  }
}
