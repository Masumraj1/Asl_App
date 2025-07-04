import 'package:asl/app/view/common_widgets/custom_appbar/custom_appbar.dart';
import 'package:asl/app/view/common_widgets/custom_network_image/custom_network_image.dart';
import 'package:asl/app/view/common_widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_colors.dart';


class DetailsWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String currentPrice;
  final String originalPrice;
  final String discount;

  const DetailsWidget({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.currentPrice,
    required this.originalPrice,
    required this.discount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CustomNetworkImage(
                imageUrl: imageUrl,
                height: 300.h,
                width: double.infinity,
              ),
            ),
            SizedBox(height: 20.h),
            CustomText(
              textAlign: TextAlign.start,
              text: title,
              maxLines: 4,
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Text(
                  "\$$currentPrice",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  "\$$originalPrice",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.red,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            if (discount.isNotEmpty && discount != '0')
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  "$discount% off",
                  style: TextStyle(
                    color: Colors.orange.shade800,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
