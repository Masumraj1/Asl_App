import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_colors.dart';

class CustomRichText extends StatelessWidget {
  final String firstText;
  final String? thirdText;
  final String secondText;
  final VoidCallback onTapAction;
  final TextStyle? firstTextStyle;
  final TextStyle? thirdTextStyle;
  final TextStyle? secondTextStyle;
  final int? maxLines;
  final TextAlign textAlign;

  const CustomRichText({
    super.key,
    required this.firstText,
    required this.secondText,
    required this.onTapAction,
    this.firstTextStyle,
    this.secondTextStyle,
    this.maxLines = 1,
    this.textAlign = TextAlign.center,
    this.thirdText,
    this.thirdTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      maxLines: maxLines,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: firstText,
            style: firstTextStyle ??
                TextStyle(
                  color: AppColors.gray,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                ),
          ),
          TextSpan(
            text: secondText,
            style: secondTextStyle ??
                TextStyle(
                  color: AppColors.emeraldGreen,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
            recognizer: TapGestureRecognizer()..onTap = onTapAction,
          ),
          TextSpan(
            text: thirdText,
            style: thirdTextStyle ??
                TextStyle(
                  color: AppColors.gray,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                ),
          ),
        ],
      ),
    );
  }
}
