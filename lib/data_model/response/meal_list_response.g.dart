// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MealListResponse _$$_MealListResponseFromJson(Map<String, dynamic> json) =>
    _$_MealListResponse(
      meals: (json['meals'] as List<dynamic>)
          .map((e) => Meal.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MealListResponseToJson(_$_MealListResponse instance) =>
    <String, dynamic>{
      'meals': instance.meals,
    };

_$_Meal _$$_MealFromJson(Map<String, dynamic> json) => _$_Meal(
      strMeal: json['strMeal'] as String,
      strMealThumb: json['strMealThumb'] as String,
      idMeal: json['idMeal'] as String,
    );

Map<String, dynamic> _$$_MealToJson(_$_Meal instance) => <String, dynamic>{
      'strMeal': instance.strMeal,
      'strMealThumb': instance.strMealThumb,
      'idMeal': instance.idMeal,
    };
