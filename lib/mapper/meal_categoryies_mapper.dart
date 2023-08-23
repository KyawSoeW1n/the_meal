import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_testing/data_model/response/meal_categories.dart';
import 'package:riverpod_testing/data_model/vo/meal_category_vo.dart';
import 'package:riverpod_testing/mapper/base/base_response_mapper.dart';

final mealCategoriesMapper =
    Provider<MealCategoriesMapper>((ref) => MealCategoriesMapper());

class MealCategoriesMapper
    implements BaseResponseMapper<MealCategories, List<MealCategoryVO>> {
  @override
  List<MealCategoryVO> mapFromResponse(MealCategories data) {
    return data.categories
        .map((e) => MealCategoryVO(
            name: e.strCategory, image: e.strCategoryThumb, id: e.idCategory))
        .toList();
  }
}
