import 'package:asl/app/view/common_widgets/custom_appbar/custom_appbar.dart';
import 'package:asl/app/view/screens/home/details/widgets/details_widget.dart';
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

      //===============Details Appbar=========
      appBar: CustomAppBar(
        onPressed: () {
          context.pop();
        },
        appBarContent: "Details",
        iconData: Icons.arrow_back,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child:
        DetailsWidget(
          imageUrl: imageUrl,
          title: title,
          currentPrice: currentPrice,
          originalPrice: originalPrice,
          discount: discount,
        )

      ),
    );
  }
}
