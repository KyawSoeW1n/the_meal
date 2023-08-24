import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_meal/core/network/exception/base_exception.dart';
import 'package:the_meal/data_model/cache/favourite_meal.dart';
import 'package:the_meal/domain/change_favourite_meal_status/change_favourite_meal_status_usecase_impl.dart';
import 'package:the_meal/features/meals/notifier/selected_meal_categories_notifier.dart';

import '../../../core/state.dart';
import '../../../data_model/vo/meal_category_vo.dart';
import '../../../domain/fetch_meal_list/fetch_posts_usecase_impl.dart';

final mealListNotifierProvider = StateNotifierProvider.autoDispose<
    MealListNotifier, State<List<MealCategoryVO>>>((ref) {
  final mealCategory = ref.watch(selectedMealCategoryNotifierProvider);
  return MealListNotifier(
    ref.read(fetchMealListUseCaseImpl),
    ref.read(changeFavouriteMealStatusUseCaseImpl),
    mealCategory.data,
  );
});

class MealListNotifier extends StateNotifier<State<List<MealCategoryVO>>> {
  final FetchMealListUseCaseImpl _getPostsUseCaseImpl;
  final ChangeFavouriteMealStatusUseCaseImpl
      _changeFavouriteMealStatusUseCaseImpl;
  final MealCategoryVO? mealCategoryVO;

  MealListNotifier(
    this._getPostsUseCaseImpl,
    this._changeFavouriteMealStatusUseCaseImpl,
    this.mealCategoryVO,
  ) : super(const State.init()) {
    getMealList();
  }

  void changeMealFavourite(CacheMeal cachePost) {
    _changeFavouriteMealStatusUseCaseImpl.changePostStatus(cachePost);
  }

  void getMealList() async {
    try {
      state = const State.loading();
      if (mealCategoryVO != null) {
        await _getPostsUseCaseImpl.fetchMealList(mealCategoryVO!.name);
        state = const State.success(null);
      }
    } on BaseException catch (e) {
      state = State.error(e);
    }
  }
}
