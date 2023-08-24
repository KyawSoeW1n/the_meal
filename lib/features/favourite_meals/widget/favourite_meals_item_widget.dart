import 'package:flutter/material.dart';
import 'package:the_meal/core/resource/app_dimens.dart';
import 'package:the_meal/data_model/cache/favourite_meal.dart';

import '../../../widget/common/text_view_widget.dart';

class FavouriteMealItemWidget extends StatelessWidget {
  final CacheMeal favouriteMeal;
  final Function function;

  const FavouriteMealItemWidget(
    this.favouriteMeal,
    this.function, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: AppDimens.margin16,
        vertical: AppDimens.margin8,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppDimens.margin8,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.margin16,
        ),
        child: Row(
          children: [
            Expanded(
              child: TextViewWidget(
                favouriteMeal.mealName,
                maxLine: 1,
              ),
            ),
            IconButton(
              onPressed: () => function(favouriteMeal),
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
