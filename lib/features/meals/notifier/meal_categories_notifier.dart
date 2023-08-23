import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_testing/core/network/exception/base_exception.dart';
import 'package:riverpod_testing/domain/fetch_meal_categories/fetch_meal_categories_usecase_impl.dart';

import '../../../core/state.dart';
import '../../../data_model/vo/meal_category_vo.dart';

final mealCategoriesNotifierProvider = StateNotifierProvider.autoDispose<
    MealCategoriesNotifier, State<List<MealCategoryVO>>>((ref) {
  return MealCategoriesNotifier(
    ref.read(fetchMealCategoriesUseCaseImpl),
  );
});

class MealCategoriesNotifier
    extends StateNotifier<State<List<MealCategoryVO>>> {
  final FetchMealCategoriesUseCaseImpl _fetchMealCategoriesUseCaseImpl;

  MealCategoriesNotifier(
    this._fetchMealCategoriesUseCaseImpl,
  ) : super(const State.init()) {
    getMealCategories();
  }

  void getMealCategories() async {
    try {
      state = const State.loading();
      final mealCategories =
          await _fetchMealCategoriesUseCaseImpl.fetchMealCategories();
      state = State.success(mealCategories);
    } on BaseException catch (e) {
      state = State.error(e);
    }
  }
}
