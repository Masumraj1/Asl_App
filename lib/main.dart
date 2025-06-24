import 'package:flutter/material.dart';

import 'app/core/utils/device_utils/device_utils.dart';
import 'my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DeviceUtils.lockDevicePortrait();
  runApp(const MyApp());
}




