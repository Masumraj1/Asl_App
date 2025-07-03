import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task360/app/core/constants/app_strings.dart';
import 'package:task360/app/view/common_widgets/custom_rich_text/custom_rich_text.dart';


import '../../../core/constants/app_colors.dart';
import '../../../core/utils/custom_assets/assets.gen.dart';
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
              child: Assets.images.logo.image(),
            ),


            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: CustomRichText(
                  firstText: AppStrings.poweredBy,
                  secondText: AppStrings.aslSystem,
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
