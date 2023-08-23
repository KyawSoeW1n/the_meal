import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal_category_vo.freezed.dart';

@freezed
class MealCategoryVO with _$MealCategoryVO {
  const factory MealCategoryVO({
    required String name,
    required String image,
    required String id,
  }) = _MealCategoryVO;
}
