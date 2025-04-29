import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task360/app/utils/app_colors/app_colors.dart';
import 'package:task360/app/utils/app_strings/app_strings.dart';
import 'package:task360/app/utils/custom_assets/assets.gen.dart';
import 'package:task360/app/view/common_widgets/custom_appbar/custom_appbar.dart';
import 'package:task360/app/view/common_widgets/custom_text/custom_text.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        iconData: Icons.arrow_back_ios,
        appBarContent: AppStrings.home,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 26.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomText(
                    text: '652',
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 4.h),
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
                              text: "13%",
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
                ],
              ),
              Row(
                children: [
                  CustomText(
                    top: 22.h,
                    text: "History",
                    font: CustomFont.inter,
                    color: AppColors.gray,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                  ),
                  const Spacer(),
                  CustomText(
                    top: 22.h,
                    text: "See all",
                    font: CustomFont.inter,
                    fontWeight: FontWeight.w400,
                    color: AppColors.gray,
                    fontSize: 16.sp,
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 216.h,
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(
                      leftTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      topTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 1,
                          getTitlesWidget: (value, meta) {
                            const style = TextStyle(
                              color: Colors.black54,
                              fontSize: 12,
                            );

                            switch (value.toInt()) {
                              case 0:
                                return Text('Oct\n24', style: style);
                              case 1:
                                return Text('Nov\n24', style: style);
                              case 2:
                                return Text('Dec\n24', style: style);
                              case 3:
                                return Text('Jan\n25', style: style);
                              case 4:
                                return Text('Feb\n25', style: style);
                              case 5:
                                return Text('Mar\n25', style: style);
                              case 6:
                                return Text('Apr\n25', style: style);
                              default:
                                return const SizedBox.shrink();
                            }
                          },
                        ),
                      ),
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: const Border(
                        bottom: BorderSide(color: Colors.grey, width: 1),
                        left: BorderSide(color: Colors.grey, width: 1),
                        right: BorderSide(color: Colors.transparent),
                        top: BorderSide(color: Colors.transparent),
                      ),
                    ),

                    minX: 0,
                    maxX: 6,
                    minY: 0,
                    maxY: 6,
                    lineBarsData: [
                      LineChartBarData(
                        spots: const [
                          FlSpot(0, 2),
                          FlSpot(1, 3.5),
                          FlSpot(2, 5),
                          FlSpot(3, 4),
                          FlSpot(4, 4.5),
                          FlSpot(5, 4.8),
                          FlSpot(6, 2),
                        ],
                        isCurved: true,
                        dotData: const FlDotData(show: true),
                        belowBarData: BarAreaData(show: false),
                        color: Colors.greenAccent,
                        barWidth: 2,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 29.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // Center the items horizontally
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      height: 230.h,
                      padding: EdgeInsets.symmetric(
                          horizontal: 22.w, vertical: 22.h),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 4,
                            offset: const Offset(0, 4), // vertical offset
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(20.r)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomText(
                            text: 'Persons',
                            font: CustomFont.inter,
                            fontSize: 24.sp,
                            bottom: 27,
                            fontWeight: FontWeight.w700,
                            color: AppColors.gray,
                          ),
                          SizedBox(
                            height: 27.h,
                          ),
                          SizedBox(
                            height: 20.h,
                            width: 80.w,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                // CircleAvatars for user images
                                ...List.generate(3, (index) {
                                  return Positioned(
                                    left: (index * 20).toDouble(),
                                    child: CircleAvatar(
                                      radius: 16.r,
                                      backgroundImage: NetworkImage(
                                          'https://randomuser.me/api/portraits/men/${index + 1}.jpg'), // Sample URL, replace with actual dynamic data
                                    ),
                                  );
                                }),

                                // CircleAvatar for extra count
                                Positioned(
                                  left: (3 * 20).toDouble(),
                                  child: CircleAvatar(
                                    radius: 16.r,
                                    backgroundColor: AppColors.gray,
                                    child: CustomText(
                                      text: "+2",
                                      font: CustomFont.poppins,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.white,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 27.w), // Space between the two containers
                  Expanded(
                    flex: 5,
                    child: Container(
                      height: 230.h,
                      padding: EdgeInsets.symmetric(
                          horizontal: 22.w, vertical: 22.h),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            AppColors.plantsCardFirst,
                            AppColors.plantsCardLast
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20.r)),
                      ),
                      child: Column(
                        children: [
                          CustomText(
                            text: 'Rooms',
                            font: CustomFont.inter,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                          ),
                          CustomText(
                            top: 22.h,
                            text: '5',
                            font: CustomFont.inter,
                            fontSize: 48.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                          ),
                          Container(
                            padding: EdgeInsets.all(5.r),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.r)),
                            ),
                            child: CustomText(
                              text: "2 of them requires action",
                              fontWeight: FontWeight.w500,
                              fontSize: 10.sp,
                              color: AppColors.emeraldGreen,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Stack(
                children: [
                  Container(
                    height: 150.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15.r)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2), // light shadow
                          blurRadius: 4,
                          offset: const Offset(0, 4), // vertical offset
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 19.h, horizontal: 26.w),
                          child: Column(
                            children: [
                              CustomText(
                                text: "Plants",
                                fontWeight: FontWeight.w700,
                                fontSize: 24.sp,
                                font: CustomFont.inter,
                                color: AppColors.emeraldGreen,
                                bottom: 16.h,
                              ),
                              Assets.images.image3.image(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Positioned container at the bottom right
                  Positioned(
                    bottom: 0,
                    right: 0,
                    // Ensures the container is positioned on the right side
                    child: Container(
                      height: 150.h,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              AppColors.plantsCardFirst,
                              AppColors.plantsCardLast
                            ],
                          ),
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.r))),
                      child: Center(
                        child: CustomText(
                          text: '43',
                          font: CustomFont.inter,
                          fontSize: 80.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 40.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
