import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_meal/data_model/cache/favourite_meal.dart';

import '../../data_source/local/favourite_post/favourite_post_local_datasource_impl.dart';
import 'change_favourite_meal_status_usecase.dart';

final changeFavouriteMealStatusUseCaseImpl =
    Provider.autoDispose<ChangeFavouriteMealStatusUseCaseImpl>((ref) =>
        ChangeFavouriteMealStatusUseCaseImpl(
            ref.read(postLocalDataSourceImpl)));

class ChangeFavouriteMealStatusUseCaseImpl
    extends ChangeFavouriteMealStatusUseCase {
  final MealsLocalDataSourceImpl _favouritePostLocalDataSourceImpl;

  ChangeFavouriteMealStatusUseCaseImpl(this._favouritePostLocalDataSourceImpl);

  @override
  Future<void> changePostStatus(CacheMeal cachePost) async {
    return await _favouritePostLocalDataSourceImpl.addFavouriteMeal(cachePost);
  }
}
