// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
//
// import 'app/core/utils/device_utils/device_utils.dart';
// import 'my_app.dart';
//
// void main()async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   DeviceUtils.lockDevicePortrait();
//   runApp(const MyApp());
//
//
// }
//
//
//
//


import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'; // for kReleaseMode
import 'package:flutter/material.dart';

import 'app/core/utils/device_utils/device_utils.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  DeviceUtils.lockDevicePortrait();

  runApp(
    DevicePreview(
      enabled: !kReleaseMode, // Enable only in debug mode
      builder: (context) => const MyApp(),
    ),
  );
}
