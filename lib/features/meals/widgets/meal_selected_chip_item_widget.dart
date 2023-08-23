import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_testing/data_model/vo/meal_category_vo.dart';

import '../../../core/resource/app_colors.dart';
import '../../../core/resource/app_dimens.dart';
import '../../../widget/common/text_view_widget.dart';

class MealSelectedChipItemWidget extends StatelessWidget {
  final MealCategoryVO mealCategoryVO;
  final bool isSelected;
  final Function function;

  const MealSelectedChipItemWidget(this.mealCategoryVO, this.isSelected, this.function,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      padding: const EdgeInsets.all(AppDimens.margin8),
      backgroundColor: Colors.white,
      label: TextViewWidget(
        mealCategoryVO.name ?? "",
        fontWeight: FontWeight.w600,
      ),
      selected: isSelected,
      onSelected: (bool selected) {
        function(mealCategoryVO);
      },
      selectedColor: AppColors.black,
      labelStyle: GoogleFonts.beVietnamPro(
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
