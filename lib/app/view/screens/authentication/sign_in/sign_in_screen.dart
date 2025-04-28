import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/app/utils/app_strings/app_strings.dart';
import 'package:recipe_app/app/view/common_widgets/custom_text/custom_text.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: 43.h,horizontal: 33.w),
        child: Column(
          children: [
            CustomText(
              font: CustomFont.poppins,
              text: AppStrings.signIn,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontSize: 30.sp,
            )
          ],
        ),
      ),
    );
  }
}
