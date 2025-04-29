import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task360/app/core/route_path.dart';
import 'package:task360/app/core/routes.dart';
import 'package:task360/app/global/helper/toast_message/toast_message.dart';
import 'package:task360/app/utils/app_strings/app_strings.dart';

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
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      User? user = userCredential.user;

      toastMessage(message: AppStrings.loginSuccessful);

      if (user != null) {
        debugPrint(" UID: ======================>>>${user.uid}");
        debugPrint("Email: ======================>>>${user.email}");
        debugPrint("Email Verified: ======================>>> ${user.emailVerified}");
        debugPrint(" Photo URL: ======================>>> ${user.photoURL}");
      }

      AppRouter.route.goNamed(RoutePath.homeScreen);
    } catch (e) {
      toastMessage(message: AppStrings.loginFailed);
      debugPrint("❌ Sign in error: $e");
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

      toastMessage(message: AppStrings.accountCreatedSuccessfully);

      if (userCredential != null) {
        debugPrint(" user: ======================>>>${userCredential.user}");
        debugPrint("Name: ${nameController.text}");
        debugPrint("Email: ${emailController.text}");
      }
      AppRouter.route.goNamed(RoutePath.homeScreen);
    } catch (e) {
      toastMessage(message: AppStrings.signUpFailed);
    } finally {
      isSignUpLoading.value = false;
    }
  }
}
