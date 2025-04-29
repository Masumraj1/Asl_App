import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task360/app/utils/app_colors/app_colors.dart';
import 'package:task360/app/utils/app_strings/app_strings.dart';
import 'package:task360/app/utils/custom_assets/assets.gen.dart';
import 'package:task360/app/view/common_widgets/custom_rich_text/custom_rich_text.dart';


import 'controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashController splashController = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Stack(
          children: [

            Center(
              child: Assets.images.appIcon.image(),
            ),


            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: CustomRichText(
                  firstText: AppStrings.poweredBy,
                  secondText: AppStrings.m360,
                  onTapAction: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
