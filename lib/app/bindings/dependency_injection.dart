
import 'package:get/get.dart';

import '../view/screens/authentication/controller/auth_controller.dart';
import '../view/screens/home/controller/home_controller.dart';
import '../view/screens/home/drawer/add/controller/post_controller.dart';
import '../view/screens/splash/controller/splash_controller.dart';


class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController(), fenix: true);
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => PostController(), fenix: true);


  }
}