import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_meal/data_model/vo/meal_category_vo.dart';

import '../../../core/resource/app_dimens.dart';
import '../../../widget/common/text_view_widget.dart';

class MealSelectedChipItemWidget extends StatelessWidget {
  final MealCategoryVO mealCategoryVO;
  final bool isSelected;
  final Function function;

  const MealSelectedChipItemWidget(
      this.mealCategoryVO, this.isSelected, this.function,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.margin8,
      ),
      child: ChoiceChip(
        padding: const EdgeInsets.all(AppDimens.margin8),
        label: TextViewWidget(
          mealCategoryVO.name ?? "",
          fontWeight: FontWeight.w600,
        ),
        selected: isSelected,
        onSelected: (bool selected) {
          function(mealCategoryVO);
        },
        labelStyle: GoogleFonts.beVietnamPro(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
