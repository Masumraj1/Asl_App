import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controller/home_controller.dart'; // যদি ScreenUtil ব্যবহার করেন

class SortSheet extends StatelessWidget {
  final HomeController homeController;

  const SortSheet({Key? key, required this.homeController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.price_change),
            title: const Text('দাম: কম → বেশি'),
            onTap: () {
              homeController.sortByPriceAscending();
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.star_rate),
            title: const Text('রেটিং: বেশি → কম'),
            onTap: () {
              homeController.sortByRatingDescending();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  static void show(BuildContext context, HomeController homeController) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (_) => SortSheet(homeController: homeController),
    );
  }
}
