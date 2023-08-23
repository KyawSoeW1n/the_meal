import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_testing/data_model/vo/meal_category_vo.dart';

final selectedChipProvider = StateProvider<MealCategoryVO>(
  (ref) => MealCategoryVO(name: "", image: "", id: ""),
);
