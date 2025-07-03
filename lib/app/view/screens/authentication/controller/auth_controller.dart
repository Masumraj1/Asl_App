import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/routes/route_path.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/toast_message/toast_message.dart';


class AuthController extends GetxController {
  RxBool isRemember = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  var isSignInLoading = false.obs;

  final emailController = TextEditingController(text: "masum12@gmail.com");
  final passwordController = TextEditingController(text: "Masum017");
  final nameController = TextEditingController();
  final confirmPasswordController = TextEditingController();

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
      // toastMessage(message: e.toString());
      // toastMessage(message: AppStrings.loginFailed);
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

  //=======================Logout Method=======================
  Future<void> signOut() async {
    try {
      await _auth.signOut();

      // Clear controllers if needed
      emailController.clear();
      passwordController.clear();
      nameController.clear();
      confirmPasswordController.clear();

      toastMessage(message:"Log Out Successful"); // if you have a logout success string

      // Navigate to Sign In screen after logout
      AppRouter.route.goNamed(RoutePath.signInScreen);
    } catch (e) {
      debugPrint("❌ Sign out error: $e");
      toastMessage(message: "Log Out Failed"); // optional failure toast
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    confirmPasswordController.dispose();

    super.onClose();
  }

}
