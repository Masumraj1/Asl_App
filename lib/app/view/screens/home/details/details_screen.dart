import 'package:asl/app/view/common_widgets/custom_appbar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';

class DetailsScreen extends StatelessWidget {
  final Map<String, dynamic> data;

  const DetailsScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl = data['imageUrl'] ?? '';
    final title = data['title'] ?? '';
    final currentPrice = data['currentPrice'] ?? '';
    final originalPrice = data['originalPrice'] ?? '';
    final discount = data['discount'] ?? '';

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        onPressed: (){
          context.pop();
        },
        appBarContent: "Details",
        iconData: Icons.arrow_back,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.network(
                  imageUrl,
                  width: double.infinity,
                  height: 250.h,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                      const Icon(Icons.broken_image, size: 100),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              title,
              style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Text(
                  "\$$currentPrice",
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                "$discount% off",
                style: TextStyle(
                    color: Colors.orange.shade800, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20.h),
            const Text(
              "Product description goes here. You can add detailed information about the product here as needed.",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
