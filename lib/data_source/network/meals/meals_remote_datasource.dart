import '../../../data_model/cache/favourite_meal.dart';
import '../../../data_model/vo/meal_category_vo.dart';

abstract class MealsRemoteDataSource {
  Future<List<CacheMeal>> getMealList();

  Future<List<MealCategoryVO>> getMealCategories();
}
