import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_meal/core/base/base_view.dart';
import 'package:the_meal/features/favourite_meals/widget/favourite_meals_item_widget.dart';
import 'package:the_meal/widget/common/common_app_bar.dart';

import '../../data_source/local/app_database.dart';
import 'notifier/favourite_meals_notifier.dart';

class FavouriteMealsScreen extends BaseView {
  FavouriteMealsScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
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
                child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return FavouriteMealItemWidget(
                        content[index],
                        favouritePostNotiProvider.changePostStatus,
                      );
                    },
                    childCount: content.length, // Number of items in the list
                  ),
                )
              ],
            ));
          },
        )
      ],
    );
  }
}
