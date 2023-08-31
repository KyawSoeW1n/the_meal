import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:the_meal/data_model/cache/favourite_meal.dart';
import 'package:the_meal/domain/change_favourite_meal_status/change_favourite_meal_status_usecase.dart';
import 'package:the_meal/domain/change_favourite_meal_status/change_favourite_meal_status_usecase_impl.dart';

import '../../../core/state.dart';
import '../../../data_model/vo/meal_category_vo.dart';

final favouritePostNotifierProvider =
    StateNotifierProvider<FavouritePostNotifier, State<List<MealCategoryVO>>>(
  (ref) {
    return FavouritePostNotifier(
      ref.read(changeFavouriteMealStatusUseCaseImpl),
    );
  },
);

class FavouritePostNotifier extends StateNotifier<State<List<MealCategoryVO>>> {
  final ChangeFavouriteMealStatusUseCase _changeFavouriteMealStatusUseCase;

  FavouritePostNotifier(
    this._changeFavouriteMealStatusUseCase,
  ) : super(const State.init());

  void changePostStatus(CacheMeal cachePost) {
    _changeFavouriteMealStatusUseCase.changePostStatus(cachePost);
  }
}
