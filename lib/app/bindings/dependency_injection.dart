
import 'package:get/get.dart';
import 'package:scholarship/app/view/screens/authentication/controller/auth_controller.dart';
import 'package:scholarship/app/view/screens/splash/controller/splash_controller.dart';


class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController(), fenix: true);
    Get.lazyPut(() => AuthController(), fenix: true);


  }
}