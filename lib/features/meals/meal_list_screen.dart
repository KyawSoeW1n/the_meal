import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:the_meal/core/resource/app_dimens.dart';
import 'package:the_meal/features/meals/widgets/cache_post_list_widget.dart';
import 'package:the_meal/features/meals/widgets/error_handling_widget.dart';
import 'package:the_meal/features/meals/widgets/meal_categories_header_widget.dart';
import 'package:the_meal/widget/common/common_app_bar.dart';
import 'package:the_meal/widget/common/loading_widget.dart';

import '../../app_constants/app_routes.dart';
import '../../core/base/base_view.dart';
import '../../data_source/local/app_database.dart';
import 'notifier/meal_categories_notifier.dart';
import 'notifier/meal_list_notifier.dart';
import 'notifier/selected_meal_categories_notifier.dart';

class MealListScreen extends BaseView {
  MealListScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context, WidgetRef ref) {
    return CommonAppBar(
      "Meals",
      actionList: [
        IconButton(
          onPressed: () => context.go("/${AppRoutes.setting}"),
          icon: const Icon(Icons.settings),
        ),
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final refreshController = RefreshController();

    final mealListProvider = ref.watch(mealListNotifierProvider);
    final mealCategoriesProvider = ref.watch(mealCategoriesNotifierProvider);
    final selectedMealCategoryProvider =
        ref.watch(selectedMealCategoryNotifierProvider);

    final postListStreamProvider = ref.watch(mealListStreamProvider);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.margin8,
          ),
          child: mealCategoriesProvider.maybeWhen(
            orElse: () => const SizedBox(),
            loading: () => const LoadingWidget(),
            success: (data) => SizedBox(
              height: 30,
              child: MealCategoriesHeaderWidget(
                data ?? [],
                selectedMealCategoryProvider.data,
                (mealCategoryVO) {
                  ref
                      .read(selectedMealCategoryNotifierProvider.notifier)
                      .changeMealCategory(mealCategoryVO);
                },
              ),
            ),
          ),
        ),
        const SizedBox(
          height: AppDimens.margin16,
        ),
        Expanded(
          child: SmartRefresher(
            controller: refreshController,
            onRefresh: () =>
                ref.read(mealListNotifierProvider.notifier).getMealList(),
            child: mealListProvider.maybeWhen(
              loading: () => const LoadingWidget(),
              success: (data) => const CacheMealListWidget(),
              error: (e) => postListStreamProvider.value != null
                  ? const CacheMealListWidget()
                  : Center(
                      child: ErrorHandlingWidget(exception: e),
                    ),
              orElse: () => const SizedBox(),
            ),
          ),
        ),
      ],
    );
  }
}
