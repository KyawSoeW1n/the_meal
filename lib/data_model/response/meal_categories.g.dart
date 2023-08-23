// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MealCategories _$$_MealCategoriesFromJson(Map<String, dynamic> json) =>
    _$_MealCategories(
      categories: (json['categories'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MealCategoriesToJson(_$_MealCategories instance) =>
    <String, dynamic>{
      'categories': instance.categories,
    };

_$_Category _$$_CategoryFromJson(Map<String, dynamic> json) => _$_Category(
      idCategory: json['idCategory'] as String,
      strCategory: json['strCategory'] as String,
      strCategoryThumb: json['strCategoryThumb'] as String,
      strCategoryDescription: json['strCategoryDescription'] as String,
    );

Map<String, dynamic> _$$_CategoryToJson(_$_Category instance) =>
    <String, dynamic>{
      'idCategory': instance.idCategory,
      'strCategory': instance.strCategory,
      'strCategoryThumb': instance.strCategoryThumb,
      'strCategoryDescription': instance.strCategoryDescription,
    };
