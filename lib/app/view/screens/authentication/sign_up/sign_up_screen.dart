import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:task360/app/global/helper/validators/validators.dart';
import 'package:task360/app/utils/app_colors/app_colors.dart';
import 'package:task360/app/utils/app_strings/app_strings.dart';
import 'package:task360/app/utils/custom_assets/assets.gen.dart';
import 'package:task360/app/view/common_widgets/custom_button/custom_button.dart';
import 'package:task360/app/view/common_widgets/custom_from_card/custom_from_card.dart';
import 'package:task360/app/view/common_widgets/custom_loader/custom_loader.dart';
import 'package:task360/app/view/common_widgets/custom_rich_text/custom_rich_text.dart';
import 'package:task360/app/view/common_widgets/custom_text/custom_text.dart';
import 'package:task360/app/view/screens/authentication/controller/auth_controller.dart';
import 'package:task360/app/view/screens/authentication/sign_in/inner_widgets/header_text.dart';
import 'package:task360/app/view/screens/authentication/sign_in/inner_widgets/sociel_icon_row.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final AuthController authController = Get.find<AuthController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 43.h, horizontal: 33.w),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderText(
                  title: AppStrings.signUp,
                ),

                SizedBox(
                  height: 120.h,
                ),

                //==========================name=================
                CustomFromCard(
                    hinText: AppStrings.enterYourName,
                    title: AppStrings.name,
                    controller: authController.nameController,
                    validator: Validators.nameValidator),

                //==========================Phone Number=================
                // CustomFromCard(
                //     hinText: "17XXXXXXXX",
                //     title: AppStrings.phoneNumber,
                //     controller: TextEditingController(),
                //     validator: (v) {}),

                //==========================Email=================
                CustomFromCard(
                    hinText: AppStrings.userExampleEmail,
                    title: AppStrings.email,
                    controller: authController.emailController,
                    validator: Validators.emailValidator),

                //==========================Password=================

                CustomFromCard(
                    isPassword: true,
                    hinText: AppStrings.enterYourPassword,
                    title: AppStrings.password,
                    controller: authController.passwordController,
                    validator: Validators.passwordValidator),

                //==========================Confirm Password=================

                CustomFromCard(
                  isPassword: true,
                  hinText: AppStrings.enterYourPassword,
                  title: AppStrings.confirmPassword,
                  controller: TextEditingController(),
                  validator: (value) {
                    // Pass the password value for confirmation check
                    return Validators.confirmPasswordValidator(
                        value, authController.passwordController.text);
                  },
                ),

                SizedBox(
                  height: 47.h,
                ),

                //================Sign In Button================
                Obx(() => authController.isSignUpLoading.value
                    ? const CustomLoader()
                    : CustomButton(
                        title: AppStrings.signUp,
                        isRadius: true,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            authController.signUp();
                          }
                        },
                        textColor: AppColors.white,
                      )),

                SizedBox(
                  height: 42.h,
                ),

                Center(
                  child: CustomText(
                    textAlign: TextAlign.center,
                    text: AppStrings.orSignUp,
                    font: CustomFont.inter,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.gray,
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),

                //========================Social Login====================
                SocialLoginIconsRow(
                  icons: [
                    SocialIconModel(
                      icon: Assets.images.google,
                      onTap: () {
                        print("Google Login Clicked");
                      },
                    ),
                    SocialIconModel(
                      icon: Assets.images.facebook,
                      onTap: () {
                        print("Facebook Login Clicked");
                      },
                    ),
                    SocialIconModel(
                      icon: Assets.images.microsoft,
                      onTap: () {
                        print("Microsoft Login Clicked");
                      },
                    ),
                    SocialIconModel(
                      icon: Assets.images.apple,
                      onTap: () {
                        print("Apple Login Clicked");
                      },
                    ),
                  ],
                ),

                SizedBox(
                  height: 99.h,
                ),

                Center(
                  child: CustomRichText(
                    firstText: AppStrings.alreadyHaveAnAccount,
                    secondText: AppStrings.signIn,
                    onTapAction: () {
                      context.pop();
                    },
                  ),
                ),
                SizedBox(
                  height: 56.h,
                ),

                Center(
                  child: CustomRichText(
                    firstText: AppStrings.poweredBy,
                    secondText: AppStrings.m360,
                    onTapAction: () {},
                  ),
                ),

                SizedBox(
                  height: 41.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
