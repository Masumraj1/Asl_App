import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:task360/app/utils/app_colors/app_colors.dart';
import 'package:task360/app/utils/custom_assets/assets.gen.dart';
import 'package:task360/app/view/common_widgets/custom_text/custom_text.dart';

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
      backgroundColor: widget.appBarBgColor,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: Row(
          children: [
            if (widget.iconData != null)
              IconButton(
                icon: Icon(widget.iconData),
                color: AppColors.gray,
                onPressed: () {
                  context.pop();
                },
              ),
            Assets.images.home1.image(),
            SizedBox(
              width: 14.w,
            ),
            if (widget.appBarContent != null)
              CustomText(
                text: widget.appBarContent!,
                textAlign: TextAlign.center,
                font: CustomFont.poppins,
                fontWeight: FontWeight.w300,
                fontSize: 24.sp,
                color: AppColors.black,
              ),
            const Spacer(),
            Container(
              padding: EdgeInsets.all(7.r),
              decoration: BoxDecoration(
                  color: AppColors.emeraldGreen,
                  borderRadius: BorderRadius.all(Radius.circular(10.r))),
              child: CustomText(
                text: "Good",
                textAlign: TextAlign.center,
                font: CustomFont.inter,
                fontWeight: FontWeight.w700,
                fontSize: 12.sp,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
