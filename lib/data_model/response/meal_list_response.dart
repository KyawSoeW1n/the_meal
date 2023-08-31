import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal_list_response.freezed.dart';
part 'meal_list_response.g.dart';

@freezed
class MealListResponse with _$MealListResponse {
  const factory MealListResponse({
    required List<Meal> meals,
  }) = _MealListResponse;

  factory MealListResponse.fromJson(Map<String, dynamic> json) =>
      _$MealListResponseFromJson(json);
}

@freezed
class Meal with _$Meal {
  const factory Meal({
    required String strMeal,
    required String strMealThumb,
    required String idMeal,
  }) = _Meal;

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);
}
