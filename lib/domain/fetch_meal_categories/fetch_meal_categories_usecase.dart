import 'package:riverpod_testing/data_model/vo/meal_category_vo.dart';

abstract class FetchMealCategoriesUseCase {
  Future<List<MealCategoryVO>> fetchMealCategories();
}
