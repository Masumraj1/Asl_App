
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/app/utils/app_colors/app_colors.dart';
import 'package:recipe_app/app/view/common_widgets/custom_text/custom_text.dart';
import 'package:recipe_app/app/view/common_widgets/custom_text_field/custom_text_field.dart';


class CustomFromCard extends StatelessWidget {
  final String title;
  final String? hinText;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final bool isPassword;
  final bool isRead;
  final bool? isBgColor;
  final int? maxLine;

  const CustomFromCard({
    super.key,
    required this.title,
    required this.controller,
    required this.validator,
    this.isPassword = false,
    this.isRead = false,
    this.hinText,
    this.maxLine, this.isBgColor = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          font: CustomFont.poppins,
          color: AppColors.black,
          text: title,
          fontWeight: FontWeight.w500,
          fontSize: 12.sp,
        ),
        CustomTextField(
          maxLines: isPassword ? 1 : (maxLine ?? 1), // Ensure single line for password
          hintStyle: const TextStyle(color: AppColors.grayD6),
          readOnly: isRead,
          validator: validator,
          isPassword: isPassword,
          textEditingController: controller,
          hintText: hinText,
          inputTextStyle: const TextStyle(color: AppColors.black),
          keyboardType: isPassword ? TextInputType.visiblePassword : TextInputType.text,
        ),
      ],
    );
  }
}
