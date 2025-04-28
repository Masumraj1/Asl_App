import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/app/utils/app_colors/app_colors.dart';
import 'package:recipe_app/app/utils/app_strings/app_strings.dart';
import 'package:recipe_app/app/view/common_widgets/custom_text/custom_text.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          font: CustomFont.poppins,
          text: AppStrings.signIn,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
          fontSize: 30.sp,
        ),
        CustomText(
          font: CustomFont.inter,
          text: AppStrings.letsSaveEnvironment,
          fontWeight: FontWeight.w400,
          color: AppColors.black,
          fontSize: 14.sp,
        ),
      ],
    );
  }
}
