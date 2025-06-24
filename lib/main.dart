import 'package:flutter/material.dart';
import 'package:scholarship/app/global/helper/device_utils/device_utils.dart';

import 'my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DeviceUtils.lockDevicePortrait();
  runApp(const MyApp());
}




