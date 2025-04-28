import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:recipe_app/app/global/controller/auth_controller.dart';
import 'package:recipe_app/app/utils/app_colors/app_colors.dart';
import 'package:recipe_app/app/utils/app_strings/app_strings.dart';
import 'package:recipe_app/app/utils/custom_assets/assets.gen.dart';
import 'package:recipe_app/app/view/common_widgets/custom_button/custom_button.dart';
import 'package:recipe_app/app/view/common_widgets/custom_from_card/custom_from_card.dart';
import 'package:recipe_app/app/view/common_widgets/custom_rich_text/custom_rich_text.dart';
import 'package:recipe_app/app/view/common_widgets/custom_text/custom_text.dart';

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

              ///: <<<<<<======🗄️🗄️🗄️🗄️🗄️🗄️💡💡Forgot Password💡💡🗄️🗄️🗄️🗄️🗄️🗄️🗄️>>>>>>>>===========

              Obx(() {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: authController.isRemember.value,
                      checkColor: AppColors.white,
                      activeColor: AppColors.emeraldGreen,
                      onChanged: (value) {
                        authController.isRemember.value = value ?? false;
                        debugPrint(
                            "Checkbox clicked, Remember value: ${authController.isRemember.value}");
                      },
                    ),
                    CustomText(
                      font: CustomFont.poppins,
                      top: 12.h,
                      text: AppStrings.rememberMe,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                      bottom: 15.h,
                    ),
                    Expanded(
                      child: CustomText(
                        font: CustomFont.inter,
                        top: 12.h,
                        text: AppStrings.forgottenPassword,
                        // fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.emeraldGreen,
                        bottom: 15.h,
                      ),
                    ),
                  ],
                );
              }),

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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.images.google.image(),
                  SizedBox(
                    width: 18.h,
                  ),
                  Assets.images.facebook.image(),
                  SizedBox(
                    width: 18.h,
                  ),
                  Assets.images.microsoft.image(),
                  SizedBox(
                    width: 18.h,
                  ),
                  Assets.images.apple.image(),
                ],
              ),
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
