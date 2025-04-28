//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:recipe_app/app/utils/app_colors/app_colors.dart';
//
// class CommonHomeAppBar extends StatelessWidget {
//   const CommonHomeAppBar({
//     super.key,
//     required this.scaffoldKey,
//     required this.name,
//     required this.image, required this.onTap,
//   });
//
//   final String name;
//   final VoidCallback onTap;
//   final String image;
//   final GlobalKey<ScaffoldState> scaffoldKey;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       color: AppColors.linearFirst,
//       margin: EdgeInsets.only(
//         top: 32.h,
//       ),
//       padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 15),
//       child: Column(
//         children: [
//           ///====================================Top Section================================
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   ///==================== Profile image =====================
//                   CustomNetworkImage(
//                       backgroundColor: Colors.white,
//                       boxShape: BoxShape.circle,
//                       imageUrl: image,
//                       height: 46,
//                       width: 46),
//
//                   SizedBox(
//                     width: 16.w,
//                   ),
//
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const CustomText(
//                         text: 'Welcome Back!',
//                         fontWeight: FontWeight.w500,
//                         color: AppColors.black,
//                         fontSize: 14,
//                       ),
//
//                       ///=====================user name =======================
//                       CustomText(
//                         text: name,
//                         fontWeight: FontWeight.w500,
//                         fontSize: 18,
//                         color: AppColors.black,
//                       )
//                     ],
//                   )
//                 ],
//               ),
//               SizedBox(
//                 width: 65.w,
//               ),
//
//               ///==========================Notification button ====================
//               IconButton(
//                   onPressed: onTap,
//                   icon: const Icon(Icons.notification_add))
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
