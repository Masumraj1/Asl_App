import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DeviceUtils {
  /// Lock app to portrait
  static void lockDevicePortrait() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  /// Unlock (allow all orientations)
  static void unlockDeviceOrientation() {
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
  }

  /// Check if keyboard is visible
  static bool isKeyboardVisible(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom > 0;
  }

  /// Get screen height
  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// Get screen width
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
