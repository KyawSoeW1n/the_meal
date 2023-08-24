import 'package:flutter/material.dart';
import 'package:the_meal/data_model/cache/favourite_meal.dart';
import 'package:the_meal/widget/common/text_view_widget.dart';

import '../../core/resource/app_dimens.dart';

class PostItem extends StatelessWidget {
  final CacheMeal favouriteMeal;
  final Function function;

  const PostItem(
    this.favouriteMeal,
    this.function, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: AppDimens.margin16,
        vertical: AppDimens.margin8,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppDimens.margin4,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: AppDimens.margin16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextViewWidget("${favouriteMeal.mealId}"),
                  TextViewWidget(
                    favouriteMeal.mealName,
                    maxLine: 1,
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () => function(favouriteMeal),
            icon: favouriteMeal.isFavourite
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_outline),
          )
        ],
      ),
    );
  }
}
