import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:recipe_app/app/global/controller/auth_controller.dart';
import 'package:recipe_app/app/utils/app_colors/app_colors.dart';
import 'package:recipe_app/app/utils/app_strings/app_strings.dart';
import 'package:recipe_app/app/view/common_widgets/custom_text/custom_text.dart';

class RememberMeAndForgotPasswordRow extends StatelessWidget {
  const RememberMeAndForgotPasswordRow({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();

    return Obx(() {
      return Row(
        children: [
          Checkbox(
            value: authController.isRemember.value,
            checkColor: AppColors.white,
            activeColor: AppColors.emeraldGreen,
            onChanged: (value) {
              authController.isRemember.value = value ?? false;
            },
          ),
          CustomText(
            font: CustomFont.poppins,
            text: AppStrings.rememberMe,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
          ),
          const Spacer(), // Push forgot password text to the right
          GestureDetector(
            onTap: () {
              // Add action if you want to navigate to Forgot Password Screen
            },
            child: const CustomText(
              font: CustomFont.inter,
              text: AppStrings.forgottenPassword,
              fontWeight: FontWeight.w700,
              color: AppColors.emeraldGreen,
            ),
          ),
        ],
      );
    });
  }
}
