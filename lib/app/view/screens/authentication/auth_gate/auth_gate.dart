// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:task360/app/utils/app_strings/app_strings.dart';
// import 'package:task360/app/view/common_widgets/custom_text/custom_text.dart';
// import 'package:task360/app/view/screens/home/home_screen.dart';
// import 'package:task360/app/view/screens/splash/splash_screen.dart';
//
// class AuthGate extends StatelessWidget {
//   const AuthGate({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Scaffold(
//             body: Center(
//               child: Shimmer.fromColors(
//                 baseColor: Colors.red.shade300,
//                 highlightColor: Colors.red.shade100,
//                 child: Container(
//                   width: 200.w,
//                   height: 50.h,
//                   color: Colors.red,
//                   child: Center(
//                       child: CustomText(
//                     text: AppStrings.loading,
//                     fontWeight: FontWeight.w500,
//                     fontSize: 18.sp,
//                     color: Colors.black,
//                   )),
//                 ),
//               ),
//             ),
//           );
//         }
//
//         if (snapshot.hasError) {
//           return  Scaffold(
//             body: Center(
//               child: CustomText(
//                 text: AppStrings.somethingWentWrong,
//                 fontWeight: FontWeight.w500,
//                 fontSize: 18.sp,
//                 color: Colors.black,
//               ),
//             ),
//           );
//         }
//
//         if (snapshot.hasData) {
//           return const HomeScreen();
//         }
//
//         return SplashScreen();
//       },
//     );
//   }
// }
