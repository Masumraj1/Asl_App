import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/core/utils/device_utils/device_utils.dart';
import 'my_app.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  DeviceUtils.lockDevicePortrait();
  runApp(const MyApp());
}




