import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/app/utils/custom_assets/assets.gen.dart';

class SocialLoginIconsRow extends StatelessWidget {
  const SocialLoginIconsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Assets.images.google.image(),
        SizedBox(width: 18.w),
        Assets.images.facebook.image(),
        SizedBox(width: 18.w),
        Assets.images.microsoft.image(),
        SizedBox(width: 18.w),
        Assets.images.apple.image(),
      ],
    );
  }
}
