import 'package:asl/app/view/screens/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    super.key,
    required this.homeController,
  });

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.error_outline, size: 80, color: Colors.red),
        SizedBox(height: 16.h),
        Text(
          "Something went wrong!",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          "Please try again later.",
          style: TextStyle(fontSize: 16.sp),
        ),
        SizedBox(height: 20.h),
        ElevatedButton(
          onPressed: () => homeController.getProduct(page: 1),
          child: const Text("Retry"),
        )
      ],
    );
  }
}