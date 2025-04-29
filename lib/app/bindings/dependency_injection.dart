
import 'package:get/get.dart';
import 'package:task360/app/global/controller/auth_controller.dart';
import 'package:task360/app/view/screens/splash/controller/splash_controller.dart';


class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController(), fenix: true);
    Get.lazyPut(() => AuthController(), fenix: true);


  }
}