import 'package:asl/app/core/constants/app_colors.dart';
import 'package:asl/app/view/common_widgets/custom_appbar/custom_appbar.dart';
import 'package:asl/app/view/common_widgets/custom_button/custom_button.dart';
import 'package:asl/app/view/common_widgets/custom_from_card/custom_from_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'controller/post_controller.dart';
import 'model/post.dart';

class AddEditPostScreen extends StatefulWidget {
  final Post? post;

  const AddEditPostScreen({this.post, Key? key}) : super(key: key);

  @override
  State<AddEditPostScreen> createState() => _AddEditPostScreenState();
}

class _AddEditPostScreenState extends State<AddEditPostScreen> {
  final PostController postController = Get.find<PostController>();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.post != null) {
      postController.titleController.text = widget.post?.title ?? "";
      postController.bodyController.text = widget.post?.body ?? "";
    }
  }

  void savePost() {
    if (!_formKey.currentState!.validate()) return;

    final title = postController.titleController.text.trim();
    final body = postController.bodyController.text.trim();

    if (widget.post == null) {
      final newPost = Post(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: title,
        body: body,
      );
      postController.addPost(newPost);
      postController.titleController.clear();
      postController.bodyController.clear();
    } else {
      postController.updatePost(widget.post!.id, title, body);
    }

    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.post != null;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        iconData: Icons.arrow_back,
        onPressed: () {
          context.pop();
        },
        appBarContent: isEditing ? 'Edit Post' : 'Add Post',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Title Field
              CustomFromCard(
                title: "Title",
                controller: postController.titleController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),
              CustomFromCard(
                maxLine: 10,
                title: "Body",
                controller: postController.bodyController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter body content';
                  }
                  return null;
                },
              ),
              // Body Field

              const SizedBox(height: 32),

              CustomButton(
                onTap: savePost,
                title: isEditing ? 'Update Post' : 'Add Post',
              ),
              // Save Button
            ],
          ),
        ),
      ),
    );
  }
}
