import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialLoginIconsRow extends StatelessWidget {
  final List<SocialIconModel> icons;

  const SocialLoginIconsRow({super.key, required this.icons});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        icons.length,
            (index) => Padding(
          padding: EdgeInsets.only(right: index != icons.length - 1 ? 18.w : 0),
          child: GestureDetector(
            onTap: icons[index].onTap,
            child: icons[index].icon.image(),
          ),
        ),
      ),
    );
  }
}

class SocialIconModel {
  final dynamic icon; // Your Assets.images
  final VoidCallback onTap;

  SocialIconModel({
    required this.icon,
    required this.onTap,
  });
}
