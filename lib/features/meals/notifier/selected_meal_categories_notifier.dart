import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:the_meal/data_model/vo/meal_category_vo.dart';

import '../../../core/state.dart';

final selectedMealCategoryNotifierProvider = StateNotifierProvider.autoDispose<
    SelectedMealNotifier, State<MealCategoryVO>>((ref) {
  return SelectedMealNotifier();
});

class SelectedMealNotifier extends StateNotifier<State<MealCategoryVO>> {
  SelectedMealNotifier() : super(const State.init());

  void changeMealCategory(MealCategoryVO mealCategoryVO) async {
    state = State.success(mealCategoryVO);
  }
}
