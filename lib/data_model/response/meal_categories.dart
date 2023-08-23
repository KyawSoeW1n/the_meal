import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal_categories.freezed.dart';
part 'meal_categories.g.dart';


@freezed
class MealCategories with _$MealCategories {
  const factory MealCategories({
    required List<Category> categories,
  }) = _MealCategories;

  factory MealCategories.fromJson(Map<String, dynamic> json) => _$MealCategoriesFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category({
    required String idCategory,
    required String strCategory,
    required String strCategoryThumb,
    required String strCategoryDescription,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}
