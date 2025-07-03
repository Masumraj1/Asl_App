import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task360/app/view/common_widgets/custom_text/custom_text.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_strings.dart';


class HeaderText extends StatelessWidget {
  const HeaderText({super.key, required this.title});


  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          font: CustomFont.poppins,
          text: title,
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
