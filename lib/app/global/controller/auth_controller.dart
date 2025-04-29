import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task360/app/core/route_path.dart';
import 'package:task360/app/core/routes.dart';

class AuthController extends GetxController{
  RxBool isRemember = false.obs;


  final FirebaseAuth _auth = FirebaseAuth.instance;
  var isSignInLoading = false.obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  //=======================Sign In Method=======================
  Future<void> signIn() async {
    isSignInLoading.value = true;
    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (Get.overlayContext != null) {
        Get.snackbar('Success', 'Login Successful');
      }

      AppRouter.route.pushNamed(RoutePath.homeScreen);

    } catch (e) {
      if (Get.overlayContext != null) {
        Get.snackbar('Error', 'Login Failed');
      }
    } finally {
      isSignInLoading.value = false;
    }
  }



}