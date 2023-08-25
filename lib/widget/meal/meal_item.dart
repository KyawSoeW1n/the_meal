import 'package:flutter/material.dart';
import 'package:the_meal/core/resource/app_colors.dart';
import 'package:the_meal/data_model/cache/favourite_meal.dart';
import 'package:the_meal/widget/common/app_cache_network_image.dart';
import 'package:the_meal/widget/common/text_view_widget.dart';

import '../../core/resource/app_dimens.dart';

class MealItem extends StatelessWidget {
  final CacheMeal cacheMeal;
  final Function function;

  const MealItem(
    this.cacheMeal,
    this.function, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppDimens.margin4,
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppDimens.margin8),
              child: AppCachedNetworkImage(
                imageUrl: cacheMeal.mealImage,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () => function(cacheMeal),
              icon: cacheMeal.isFavourite
                  ? const Icon(
                      Icons.favorite,
                      color: AppColors.primaryColor,
                    )
                  : const Icon(
                      Icons.favorite_outline,
                      color: AppColors.primaryColor,
                    ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(
                AppDimens.margin8,
              ),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                    0.1,
                    0.4,
                    0.6,
                  ],
                  colors: [
                    Colors.transparent,
                    Colors.black38,
                    Colors.black54,
                  ],
                ),
              ),
              child: TextViewWidget(
                cacheMeal.mealName,
                maxLine: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
