import 'package:asl/app/core/constants/app_colors.dart';
import 'package:asl/app/view/common_widgets/custom_appbar/custom_appbar.dart';
import 'package:asl/app/view/common_widgets/custom_text/custom_text.dart';
import 'package:asl/app/view/screens/home/drawer/post_list/widget/post_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routes/route_path.dart';
import '../add/controller/post_controller.dart';
import '../add/model/post.dart';

class PostListScreen extends StatelessWidget {
  PostListScreen({Key? key}) : super(key: key);

  final PostController postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        appBarContent: "Posts",
        showAddButton: true,
        iconData: Icons.arrow_back,
        onPressed: (){
          context.pop();
        },
        onAddPressed: () {
          context.pushNamed(RoutePath.addEditPostScreen);
        },
      ),
      body: Obx(() {
        if (postController.posts.isEmpty) {
          return Center(
              child: CustomText(
            text: "No posts found",
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: AppColors.black,
          ));
        }

        return ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
          itemCount: postController.posts.length,
          separatorBuilder: (_, __) => SizedBox(height: 12.h),
          itemBuilder: (context, index) {
            final Post post = postController.posts[index];
            return PostCard(
              title: post.title,
              body: post.body,
              onEditTap: () {
                context.pushNamed(RoutePath.addEditPostScreen, extra: post);

              },
            );
          },
        );
      }),
    );
  }
}
