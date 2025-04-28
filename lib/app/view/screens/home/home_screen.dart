import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/app/utils/app_colors/app_colors.dart';
import 'package:recipe_app/app/view/common_widgets/home_card/home_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 26.w,vertical: 41.h),
        child: Column(
          children: [
            HomeCard(
              title: "Home",
              status: "Good",
              ppmValue: "652",
              percentage: "13%",
              userImages: [
                'https://randomuser.me/api/portraits/men/11.jpg',
                'https://randomuser.me/api/portraits/women/32.jpg',
              ],
              extraCount: "2",
              onViewDetailsTap: () {
                print("Home View Details clicked");
              },
            ),



          ],
        ),
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.all(20.r),
          decoration: BoxDecoration(
            color: AppColors.emeraldGreen,
            borderRadius: BorderRadius.all(Radius.circular(20.r))
          ),
          child: Icon(Icons.add,color: AppColors.white,)),
    );
  }
}
