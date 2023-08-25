import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_meal/core/resource/app_dimens.dart';
import 'package:the_meal/widget/common/text_view_widget.dart';

import '../../../core/locale/localization_helper.dart';
import '../../../data_source/local/app_database.dart';
import '../../../widget/meal/meal_item.dart';
import '../notifier/meal_list_notifier.dart';
import '../provider/post_scroll_controller_provider.dart';
import 'error_handling_widget.dart';

class CacheMealListWidget extends ConsumerWidget {
  const CacheMealListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = ref.watch(postScrollControllerProvider);
    final postListStreamProvider = ref.watch(mealListStreamProvider);
    return postListStreamProvider.maybeWhen(
      data: (content) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.margin16,
        ),
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            content.isNotEmpty
                ? SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: AppDimens.margin8,
                      crossAxisSpacing: AppDimens.margin4,
                      childAspectRatio: 1.25,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return MealItem(
                          content[index],
                          ref
                              .read(mealListNotifierProvider.notifier)
                              .changeMealFavourite,
                        );
                      },
                      childCount: content.length, // Number of items in the list
                    ),
                  )
                : SliverFillRemaining(
                    child: Center(
                      child: TextViewWidget(
                        '${LocalizationHelper.of(context)?.noData}',
                      ),
                    ),
                  )
          ],
        ),
      ),
      error: (e, _) => ErrorHandlingWidget(exception: e),
      orElse: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
