import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/app/utils/app_colors/app_colors.dart';
import 'package:recipe_app/app/utils/app_strings/app_strings.dart';
import 'package:recipe_app/app/view/common_widgets/custom_button/custom_button.dart';
import 'package:recipe_app/app/view/common_widgets/custom_from_card/custom_from_card.dart';
import 'package:recipe_app/app/view/common_widgets/custom_text/custom_text.dart';
import 'package:recipe_app/app/view/common_widgets/custom_text_field/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 43.h, horizontal: 33.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              font: CustomFont.poppins,
              text: AppStrings.signIn,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontSize: 30.sp,
            ),
            CustomText(
              font: CustomFont.inter,
              text: AppStrings.letsSaveEnvironment,
              fontWeight: FontWeight.w400,
              color: Colors.black,
              fontSize: 14.sp,
            ),

            SizedBox(
              height: 120.h,
            ),

            CustomFromCard(
              hinText: AppStrings.userExampleEmail,
                title: AppStrings.email,
                controller: TextEditingController(),
                validator: (v) {}),

            SizedBox(
              height: 52.h,
            ),

            //================Sign In Button================
            CustomButton(
              title: AppStrings.signIn,
              isRadius: true,
              onTap: () {},
              textColor: AppColors.white,
            )
          ],
        ),
      ),
    );
  }
}
