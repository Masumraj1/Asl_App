import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task360/app/utils/app_colors/app_colors.dart';
import 'package:task360/app/view/common_widgets/custom_text/custom_text.dart';

class HomeCard extends StatelessWidget {
  final String title;
  final String status;
  final String ppmValue;
  final String percentage;
  final List<String> userImages;
  final String extraCount;
  final VoidCallback onViewDetailsTap;

  const HomeCard({
    super.key,
    required this.title,
    required this.status,
    required this.ppmValue,
    required this.percentage,
    required this.userImages,
    required this.extraCount,
    required this.onViewDetailsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.cardFirst, AppColors.white],
        ),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title and Status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: title,
                font: CustomFont.poppins,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
                fontSize: 16.sp,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.emeraldGreen,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: CustomText(
                  text: status,
                  font: CustomFont.inter,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),

          SizedBox(height: 21.h),

          /// PPM Value and Percentage
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomText(
                text: ppmValue,
                font: CustomFont.poppins,
                fontWeight: FontWeight.w300,
                color: AppColors.emeraldGreen,
                fontSize: 48.sp,
              ),
              SizedBox(width: 8.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: AppColors.emeraldGreen,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.arrow_drop_down_outlined,
                            size: 12.sp, color: AppColors.white),
                        SizedBox(width: 2.w),
                        CustomText(
                          text: percentage,
                          font: CustomFont.poppins,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                          fontSize: 12.sp,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 4.h),
                  CustomText(
                    text: "ppm",
                    font: CustomFont.poppins,
                    fontWeight: FontWeight.w300,
                    color: AppColors.emeraldGreen,
                    fontSize: 16.sp,
                  ),
                ],
              ),
              // Fix overflow by wrapping in Flexible
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 40.h,
                        width: 60.w,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            // CircleAvatars for user images
                            ...List.generate(userImages.length, (index) {
                              return Positioned(
                                left: (index * 20).toDouble(),
                                child: CircleAvatar(
                                  radius: 16.r,
                                  backgroundImage: NetworkImage(userImages[index]),
                                ),
                              );
                            }),

                            // CircleAvatar for extra count
                            Positioned(
                              left: (userImages.length * 20).toDouble(),
                              child: CircleAvatar(
                                radius: 16.r,
                                backgroundColor: AppColors.gray,
                                child: CustomText(
                                  text: "+$extraCount",
                                  font: CustomFont.poppins,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),

                            // InkWell at the bottom for "View Details"
                            // Positioned(
                            //   bottom: -8.h,  // Adjust this to move it lower, depending on the layout
                            //   left: 0,
                            //   right: 1,
                            //   child: InkWell(
                            //     onTap: onViewDetailsTap,
                            //     child: Row(
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       children: [
                            //         CustomText(
                            //           text: "View Details",
                            //           font: CustomFont.poppins,
                            //           fontWeight: FontWeight.w500,
                            //           color: AppColors.emeraldGreen,
                            //           fontSize: 12.sp,
                            //         ),
                            //         SizedBox(width: 4.w),
                            //         Assets.icons.polygon2.svg(), // Assuming this is a custom icon
                            //       ],
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),

          SizedBox(height: 12.h),
        ],
      ),
    );
  }
}
