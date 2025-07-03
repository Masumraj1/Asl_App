
import 'package:fluttertoast/fluttertoast.dart';

import '../../constants/app_colors.dart';

void toastMessage({required String message}) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: AppColors.emeraldGreen,
    textColor: AppColors.white,
    gravity: ToastGravity.BOTTOM,
    toastLength: Toast.LENGTH_LONG,
  );
}