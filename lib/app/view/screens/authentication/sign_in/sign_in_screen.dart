import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:task360/app/view/common_widgets/custom_button/custom_button.dart';
import 'package:task360/app/view/common_widgets/custom_from_card/custom_from_card.dart';
import 'package:task360/app/view/common_widgets/custom_loader/custom_loader.dart';
import 'package:task360/app/view/common_widgets/custom_rich_text/custom_rich_text.dart';
import 'package:task360/app/view/common_widgets/custom_text/custom_text.dart';
import 'package:task360/app/view/screens/authentication/controller/auth_controller.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/routes/route_path.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/validators/validators.dart';
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
                          // AppRouter.route.goNamed(RoutePath.homeScreen);
                          if (_formKey.currentState!.validate()) {
                            authController.signIn();
                          }
                        },
                        textColor: AppColors.white,
                      )),




                SizedBox(
                  height: 20.h,
                ),

                Center(
                  child: CustomRichText(
                    firstText: AppStrings.dontHaveAnAccount,
                    secondText: AppStrings.signUp,
                    onTapAction: () {
                      AppRouter.route.pushNamed(RoutePath.signUpScreen);
                    },
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),

                Center(
                  child: CustomRichText(
                    firstText: AppStrings.poweredBy,
                    secondText: AppStrings.aslSystem,
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
