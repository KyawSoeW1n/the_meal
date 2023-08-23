import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_testing/core/network/exception/base_exception.dart';
import 'package:riverpod_testing/data_model/cache/favourite_meal.dart';
import 'package:riverpod_testing/domain/change_favourite_meal_status/change_favourite_meal_status_usecase_impl.dart';

import '../../../core/state.dart';
import '../../../data_model/vo/meal_category_vo.dart';
import '../../../domain/fetch_meal_list/fetch_posts_usecase_impl.dart';

final mealListNotifierProvider =
    StateNotifierProvider.autoDispose<MealListNotifier, State<List<MealCategoryVO>>>(
        (ref) {
  return MealListNotifier(
    ref.read(fetchMealListUseCaseImpl),
    ref.read(changeFavouriteMealStatusUseCaseImpl),
  );
});

class MealListNotifier extends StateNotifier<State<List<MealCategoryVO>>> {
  final FetchMealListUseCaseImpl _getPostsUseCaseImpl;
  final ChangeFavouriteMealStatusUseCaseImpl
      _changeFavouriteMealStatusUseCaseImpl;

  MealListNotifier(
    this._getPostsUseCaseImpl,
    this._changeFavouriteMealStatusUseCaseImpl,
  ) : super(const State.init()) {
    getMealList();
  }

  void changeMealFavourite(CacheMeal cachePost) {
    _changeFavouriteMealStatusUseCaseImpl.changePostStatus(cachePost);
  }

  void getMealList() async {
    try {
      state = const State.loading();
      await _getPostsUseCaseImpl.fetchMealList();
      state = const State.success(null);
    } on BaseException catch (e) {
      state = State.error(e);
    }
  }
}
