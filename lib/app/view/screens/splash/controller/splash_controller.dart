

import 'package:get/get.dart';
import 'package:task360/app/core/route_path.dart';
import 'package:task360/app/core/routes.dart';



class SplashController extends GetxController{



  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 2), (){
      AppRouter.route.goNamed(RoutePath.signInScreen);
    });
    super.onReady();
  }

}