import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_testing/data_model/cache/favourite_meal.dart';
import 'package:riverpod_testing/mapper/base/base_response_mapper.dart';

final mealMapper = Provider<MealsMapper>((ref) => MealsMapper());

class MealsMapper implements BaseResponseMapper<List, List<CacheMeal>> {
  @override
  List<CacheMeal> mapFromResponse(List data) {
    return [];
    // return data
    //     .map((e) => CacheMeal(
    //           MealListResponse.fromJson(e).meals,
    //           MealCategories.fromJson(e).title,
    //           MealCategories.fromJson(e).title,
    //           false,
    //         ))
    //     .toList();
  }
}
