import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task360/app/core/route_path.dart';
import 'package:task360/app/core/routes.dart';
import 'package:task360/app/global/helper/toast_message/toast_message.dart';

class AuthController extends GetxController {
  RxBool isRemember = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  var isSignInLoading = false.obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  //=======================Sign In Method=======================
  Future<void> signIn() async {
    isSignInLoading.value = true;
    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
     toastMessage(message: "Login Successful");

      AppRouter.route.pushNamed(RoutePath.homeScreen);
    } catch (e) {
      toastMessage(message: "Login Failed");

    } finally {
      isSignInLoading.value = false;
    }
  }

  //=======================Sign Up Method=======================
  var isSignUpLoading = false.obs;

  Future<void> signUp() async {
    isSignUpLoading.value = true;
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      await userCredential.user?.updateDisplayName(nameController.text.trim());

      if (Get.overlayContext != null) {
        Get.snackbar('Success', 'Account Created Successfully');
      }

      AppRouter.route.pushNamed(RoutePath.homeScreen);
    } catch (e) {
      if (Get.overlayContext != null) {
        Get.snackbar('Error', 'Sign Up Failed:');
      }
    } finally {
      isSignUpLoading.value = false;
    }
  }
}
