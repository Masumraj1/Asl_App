import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title and Status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 10.h),

          /// PPM Value and Percentage
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                ppmValue,
                style: TextStyle(
                  fontSize: 50.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(width: 8.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.arrow_downward, size: 12.sp, color: Colors.green),
                        SizedBox(width: 2.w),
                        Text(
                          percentage,
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "ppm",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 12.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 40.h,
                width: 120.w, // or use double.infinity if you want flexible width
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ...List.generate(userImages.length, (index) {
                      return Positioned(
                        left: (index * 20).toDouble(),
                        child: CircleAvatar(
                          radius: 16.r,
                          backgroundImage: NetworkImage(userImages[index]),
                        ),
                      );
                    }),
                    Positioned(
                      left: (userImages.length * 20).toDouble(),
                      child: CircleAvatar(
                        radius: 16.r,
                        backgroundColor: Colors.green,
                        child: Text(
                          "+$extraCount",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // View Details button
              InkWell(
                onTap: onViewDetailsTap,
                child: Row(
                  children: [
                    Text(
                      "View Details",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 14.sp,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
            ],
          )

        ],
      ),
    );
  }
}
