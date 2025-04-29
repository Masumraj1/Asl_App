import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task360/app/utils/app_colors/app_colors.dart';
import 'package:task360/app/utils/app_constants/app_constants.dart';
import 'package:task360/app/utils/app_strings/app_strings.dart';
import 'package:task360/app/view/common_widgets/custom_network_image/custom_network_image.dart';
import 'package:task360/app/view/common_widgets/custom_rich_text/custom_rich_text.dart';
import 'package:task360/app/view/common_widgets/custom_text/custom_text.dart';

class CommonHomeAppBar extends StatelessWidget {
  const CommonHomeAppBar({
    super.key,
    required this.scaffoldKey,
    required this.name,
    required this.image,
    required this.onTap,
    required this.title,
  });

  final String name;
  final String title;
  final VoidCallback onTap;
  final String image;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background with main content
        Container(
          height: 206.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.begin,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50.r),
              bottomRight: Radius.circular(50.r),
            ),
          ),
          margin: EdgeInsets.only(top: 32.h),
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 71.h),
              CustomText(
                text: title,
                fontSize: 16.sp,
                fontWeight: FontWeight.w300,
                font: CustomFont.poppins,
                color: AppColors.gray,
              ),
              CustomText(
                text: name,
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
                font: CustomFont.poppins,
                color: AppColors.black,
              ),
              SizedBox(height: 27.h),
              CustomRichText(
                firstText: AppStrings.youAreInA,
                secondText: AppStrings.healthy,
                thirdText: AppStrings.environment,
                onTapAction: onTap,
              ),
              SizedBox(height: 22.h),
            ],
          ),
        ),

        // Curved colored section with image on the right
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            height: 206.h,
            width: MediaQuery.of(context).size.width / 2,
           decoration: BoxDecoration(
             color: AppColors.end,
             borderRadius: BorderRadius.only(bottomRight: Radius.circular(50.r))
           ),
            child: Center(
              child: CustomNetworkImage(
                imageUrl: image.isNotEmpty ? image : AppConstants.demoImage,
                height: 97.h,
                width: 97.w,
                boxShape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
