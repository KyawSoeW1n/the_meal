import 'package:flutter/material.dart';

import '../../../data_model/vo/meal_category_vo.dart';
import 'meal_selected_chip_item_widget.dart';

class MealCategoriesHeaderWidget extends StatelessWidget {
  final List<MealCategoryVO> mealCategoryList;
  final MealCategoryVO? selectedLeagueVO;
  final Function function;

  const MealCategoriesHeaderWidget(
      this.mealCategoryList, this.selectedLeagueVO, this.function,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: mealCategoryList
          .map(
            (e) => MealSelectedChipItemWidget(
              e,
              selectedLeagueVO == e,
              function,
            ),
          )
          .toList(),
    );
  }
}
