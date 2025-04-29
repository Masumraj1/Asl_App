import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task360/app/core/route_path.dart';
import 'package:task360/app/core/routes.dart';
import 'package:task360/app/global/helper/validators/validators.dart';
import 'package:task360/app/utils/app_colors/app_colors.dart';
import 'package:task360/app/utils/app_strings/app_strings.dart';
import 'package:task360/app/utils/custom_assets/assets.gen.dart';
import 'package:task360/app/view/common_widgets/custom_button/custom_button.dart';
import 'package:task360/app/view/common_widgets/custom_from_card/custom_from_card.dart';
import 'package:task360/app/view/common_widgets/custom_loader/custom_loader.dart';
import 'package:task360/app/view/common_widgets/custom_rich_text/custom_rich_text.dart';
import 'package:task360/app/view/common_widgets/custom_text/custom_text.dart';
import 'package:task360/app/view/common_widgets/remember_and_forget_password/remember_and_forget_password.dart';
import 'package:task360/app/view/screens/authentication/controller/auth_controller.dart';
import 'package:task360/app/view/screens/authentication/sign_in/inner_widgets/sociel_icon_row.dart';

import 'inner_widgets/header_text.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

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
                  title: AppStrings.signIn,
                ),

                SizedBox(
                  height: 120.h,
                ),

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

                ///: <<<<<<======🗄️🗄️🗄️🗄️🗄️🗄️💡💡RememberMeAndForgotPasswordRow💡💡🗄️🗄️🗄️🗄️🗄️🗄️🗄️>>>>>>>>===========

                const RememberMeAndForgotPasswordRow(),

                SizedBox(
                  height: 52.h,
                ),

                //================Sign In Button================

                Obx(() => authController.isSignInLoading.value
                    ? const CustomLoader()
                    : CustomButton(
                        title: AppStrings.signIn,
                        isRadius: true,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            authController.signIn();
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

                //========================Social Login====================
                SocialLoginIconsRow(
                  icons: [
                    SocialIconModel(
                      icon: Assets.images.google,
                      onTap: () {
                        debugPrint("Google Login Clicked");
                      },
                    ),
                    SocialIconModel(
                      icon: Assets.images.facebook,
                      onTap: () {
                        debugPrint("Facebook Login Clicked");
                      },
                    ),
                    SocialIconModel(
                      icon: Assets.images.microsoft,
                      onTap: () {
                        debugPrint("Microsoft Login Clicked");
                      },
                    ),
                    SocialIconModel(
                      icon: Assets.images.apple,
                      onTap: () {
                        debugPrint("Apple Login Clicked");
                      },
                    ),
                  ],
                ),

                SizedBox(
                  height: 99.h,
                ),

                CustomRichText(
                  firstText: AppStrings.dontHaveAnAccount,
                  secondText: AppStrings.signUp,
                  onTapAction: () {
                    AppRouter.route.pushNamed(RoutePath.signUpScreen);
                  },
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
      ),
    );
  }
}
