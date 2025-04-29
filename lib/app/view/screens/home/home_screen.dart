import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task360/app/core/route_path.dart';
import 'package:task360/app/core/routes.dart';
import 'package:task360/app/utils/app_colors/app_colors.dart';
import 'package:task360/app/utils/app_constants/app_constants.dart';
import 'package:task360/app/utils/app_strings/app_strings.dart';
import 'package:task360/app/view/common_widgets/common_home_app_bar/common_home_app_bar.dart';
import 'package:task360/app/view/common_widgets/custom_text/custom_text.dart';
import 'package:task360/app/view/common_widgets/home_card/home_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //==========================Home Appbar====================
          CommonHomeAppBar(
            scaffoldKey: scaffoldKey,
            name: 'Ahmed Ariyan',
            image: AppConstants.demoImage,
            onTap: () {},
            title: 'Good Morning',
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 41.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: AppStrings.myPlace,
                      font: CustomFont.poppins,
                      fontWeight: FontWeight.w300,
                      color: AppColors.black,
                      fontSize: 16.sp,
                    ),
                    Column(
                      children: List.generate(2, (index) {
                        return GestureDetector(
                          onTap: (){
                            AppRouter.route.pushNamed(RoutePath.detailsScreen);

                          },
                          child: HomeCard(
                            title: "Home",
                            status: "Good",
                            ppmValue: "652",
                            percentage: "13%",
                            userImages: const [
                              'https://randomuser.me/api/portraits/men/11.jpg',
                              'https://randomuser.me/api/portraits/women/32.jpg',
                            ],
                            extraCount: "2",
                            onViewDetailsTap: () {
                              debugPrint("Home View Details clicked");
                            },
                          ),
                        );
                      }),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
          padding: EdgeInsets.all(20.r),
          decoration: BoxDecoration(
              color: AppColors.emeraldGreen,
              borderRadius: BorderRadius.all(Radius.circular(20.r))),
          child: Icon(
            Icons.add,
            color: AppColors.white,
          )),
    );
  }
}
