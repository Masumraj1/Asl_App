import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_colors.dart';
import '../custom_text/custom_text.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double appBarHeight;
  final double? appBarWidth;
  final Color appBarBgColor;
  final String? appBarContent;
  final IconData? iconData; // leading icon (e.g. back arrow)
  final VoidCallback? onPressed; // leading icon onPressed

  // নতুন: add button এর icon এবং onPressed
  final bool showAddButton;
  final VoidCallback? onAddPressed;

  const CustomAppBar({
    this.appBarHeight = 64,
    this.appBarWidth,
    this.appBarBgColor = AppColors.white,
    this.appBarContent,
    super.key,
    this.iconData,
    this.onPressed,
    this.showAddButton = false, // ডিফল্ট false
    this.onAddPressed,
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
      surfaceTintColor: AppColors.white,
      centerTitle: true,
      backgroundColor: widget.appBarBgColor,
      automaticallyImplyLeading: widget.iconData == null,
      leading: widget.iconData != null
          ? IconButton(
        icon: Icon(widget.iconData, color: AppColors.black),
        onPressed: widget.onPressed,
      )
          : null,

      // এখানে add button optional হিসেবে রাখলাম
      actions: widget.showAddButton
          ? [
        IconButton(
          icon: const Icon(Icons.add, color: AppColors.black),
          tooltip: "Add New Post",
          onPressed: widget.onAddPressed,
        ),
      ]
          : null,

      title: Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: CustomText(
          text: widget.appBarContent ?? "",
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
