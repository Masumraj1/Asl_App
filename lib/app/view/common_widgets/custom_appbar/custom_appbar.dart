import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../core/constants/app_colors.dart';
import '../custom_text/custom_text.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double appBarHeight;
  final double? appBarWidth;
  final Color appBarBgColor;
  final String? appBarContent;
  final IconData? iconData;

  const CustomAppBar({
    this.appBarHeight = 64,
    this.appBarWidth,
    this.appBarBgColor = AppColors.white,
    this.appBarContent,
    super.key,
    this.iconData,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size(appBarWidth ?? double.infinity, appBarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: widget.appBarBgColor,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: EdgeInsets.only(top: 10.h),
        child:  CustomText(
          text: widget.appBarContent!,
          textAlign: TextAlign.center,
          font: CustomFont.poppins,
          fontWeight: FontWeight.w300,
          fontSize: 24.sp,
          color: AppColors.black,
        ),
      ),
    );
  }
}
