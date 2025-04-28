import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:recipe_app/app/global/controller/auth_controller.dart';
import 'package:recipe_app/app/utils/app_colors/app_colors.dart';
import 'package:recipe_app/app/utils/app_strings/app_strings.dart';
import 'package:recipe_app/app/view/common_widgets/custom_button/custom_button.dart';
import 'package:recipe_app/app/view/common_widgets/custom_from_card/custom_from_card.dart';
import 'package:recipe_app/app/view/common_widgets/custom_rich_text/custom_rich_text.dart';
import 'package:recipe_app/app/view/common_widgets/custom_text/custom_text.dart';
import 'package:recipe_app/app/view/common_widgets/remember_and_forget_password/remember_and_forget_password.dart';
import 'package:recipe_app/app/view/screens/authentication/sign_in/inner_widgets/sociel_icon_row.dart';

import 'inner_widgets/header_text.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 43.h, horizontal: 33.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderText(),

              SizedBox(
                height: 120.h,
              ),

              //==========================Email=================
              CustomFromCard(
                  hinText: AppStrings.userExampleEmail,
                  title: AppStrings.email,
                  controller: TextEditingController(),
                  validator: (v) {}),

              //==========================Password=================

              CustomFromCard(
                  isPassword: true,
                  hinText: AppStrings.enterYourPassword,
                  title: AppStrings.password,
                  controller: TextEditingController(),
                  validator: (v) {}),

              ///: <<<<<<======🗄️🗄️🗄️🗄️🗄️🗄️💡💡RememberMeAndForgotPasswordRow💡💡🗄️🗄️🗄️🗄️🗄️🗄️🗄️>>>>>>>>===========

              const RememberMeAndForgotPasswordRow(),

              SizedBox(
                height: 52.h,
              ),

              //================Sign In Button================
              CustomButton(
                title: AppStrings.signIn,
                isRadius: true,
                onTap: () {},
                textColor: AppColors.white,
              ),

              SizedBox(
                height: 42.h,
              ),

              Center(
                child: CustomText(
                  textAlign: TextAlign.center,
                  text: AppStrings.orSignIn,
                  font: CustomFont.inter,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.gray,
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              const SocialLoginIconsRow(),

              SizedBox(
                height: 99.h,
              ),

              CustomRichText(
                firstText: AppStrings.dontHaveAnAccount,
                secondText: AppStrings.signUp,
                onTapAction: () {},
              ),
              SizedBox(
                height: 56.h,
              ),

              CustomRichText(
                firstText: AppStrings.poweredBy,
                secondText: AppStrings.m360,
                onTapAction: () {},
              ),

              SizedBox(
                height: 41.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
