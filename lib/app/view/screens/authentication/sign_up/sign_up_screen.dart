import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/utils/validators/validators.dart';
import '../../../common_widgets/custom_button/custom_button.dart';
import '../../../common_widgets/custom_from_card/custom_from_card.dart';
import '../../../common_widgets/custom_loader/custom_loader.dart';
import '../../../common_widgets/custom_rich_text/custom_rich_text.dart';
import '../controller/auth_controller.dart';
import '../sign_in/widgets/header_text.dart';

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
                  controller: authController.confirmPasswordController,
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
                  height: 20.h,
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
