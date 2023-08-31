import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_meal/core/base/base_view.dart';
import 'package:the_meal/widget/common/common_app_bar.dart';

import '../../core/resource/app_dimens.dart';
import '../../data_source/local/app_database.dart';
import '../../widget/meal/meal_item.dart';
import 'notifier/favourite_meals_notifier.dart';

class FavouriteMealsScreen extends BaseView {
  FavouriteMealsScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context, WidgetRef ref) {
    return const CommonAppBar("Favourites");
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final favouritePostNotiProvider =
        ref.watch(favouritePostNotifierProvider.notifier);
    final favouritePostsProvider = ref.watch(favouritePostListStream);
    return Column(
      children: [
        favouritePostsProvider.when(
          loading: () => const Center(
            child: CircularProgressIndicator(
              color: Colors.amber,
            ),
          ),
          error: (err, stack) => Container(),
          data: (content) {
            return Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.margin16,
              ),
              child: CustomScrollView(
                slivers: [
                  SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: AppDimens.margin8,
                      crossAxisSpacing: AppDimens.margin4,
                      childAspectRatio: 1.0,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return MealItem(
                          content[index],
                          favouritePostNotiProvider.changePostStatus,
                        );
                      },
                      childCount: content.length, // Number of items in the list
                    ),
                  )
                ],
              ),
            ));
          },
        )
      ],
    );
  }
}
