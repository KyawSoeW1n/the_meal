import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_meal/data_model/cache/favourite_meal.dart';
import 'package:the_meal/data_model/response/meal_list_response.dart';
import 'package:the_meal/mapper/base/base_response_mapper.dart';

final mealMapper = Provider<MealsMapper>((ref) => MealsMapper());

class MealsMapper
    implements BaseResponseMapper<MealListResponse, List<CacheMeal>> {
  @override
  List<CacheMeal> mapFromResponse(MealListResponse data, {Map? map}) {
    return data.meals
        .map(
          (e) => CacheMeal(
            mealId: e.idMeal,
            mealCategory: map!['categoryName'],
            ingredient: "",
            mealArea: "",
            mealImage: e.strMealThumb,
            mealInstruction: "",
            mealName: e.strMeal,
            youtubeLink: "",
            isFavourite: false,
          ),
        )
        .toList();
  }
}
