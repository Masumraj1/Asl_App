import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common_widgets/custom_text/custom_text.dart';



class PostCard extends StatelessWidget {
  final String title;
  final String body;
  final VoidCallback? onEditTap;

  const PostCard({
    Key? key,
    required this.title,
    required this.body,
    this.onEditTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      elevation: 3,
      shadowColor: Colors.deepPurple.withOpacity(0.3),
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: title,
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
              color: Colors.deepPurple,
            ),
            SizedBox(height: 8.h),
            CustomText(
              text: body,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              color: Colors.grey,
              maxLines: 10,
            ),
            SizedBox(height: 8.h),
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: onEditTap,
                child: Icon(
                  Icons.edit,
                  color: Colors.deepPurple.shade200,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
