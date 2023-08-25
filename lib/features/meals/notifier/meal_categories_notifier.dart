import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_meal/core/network/exception/base_exception.dart';
import 'package:the_meal/domain/fetch_meal_categories/fetch_meal_categories_usecase_impl.dart';
import 'package:the_meal/features/meals/notifier/selected_meal_categories_notifier.dart';

import '../../../core/state.dart';
import '../../../data_model/vo/meal_category_vo.dart';

final mealCategoriesNotifierProvider = StateNotifierProvider.autoDispose<
    MealCategoriesNotifier, State<List<MealCategoryVO>>>((ref) {
  final selectMealCategory =
      ref.watch(selectedMealCategoryNotifierProvider.notifier);
  return MealCategoriesNotifier(
    ref.read(fetchMealCategoriesUseCaseImpl),
    selectMealCategory,
  );
});

class MealCategoriesNotifier
    extends StateNotifier<State<List<MealCategoryVO>>> {
  final FetchMealCategoriesUseCaseImpl _fetchMealCategoriesUseCaseImpl;
  final SelectedMealNotifier? _mealCategoryVO;

  MealCategoriesNotifier(
    this._fetchMealCategoriesUseCaseImpl,
    this._mealCategoryVO,
  ) : super(const State.init()) {
    getMealCategories();
  }

  void getMealCategories() async {
    try {
      state = const State.loading();
      final mealCategories =
          await _fetchMealCategoriesUseCaseImpl.fetchMealCategories();
      state = State.success(mealCategories);
      _mealCategoryVO?.changeMealCategory(mealCategories.first);
    } on BaseException catch (e) {
      state = State.error(e);
    }
  }
}
