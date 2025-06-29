

import 'package:get/get.dart';

import '../../../../core/routes/route_path.dart';
import '../../../../core/routes/routes.dart';




class SplashController extends GetxController{



  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 2), (){
      AppRouter.route.goNamed(RoutePath.homeScreen);
    });
    super.onReady();
  }

}