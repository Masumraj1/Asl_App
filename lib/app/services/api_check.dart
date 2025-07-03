import 'package:get/get.dart';

import '../core/constants/app_constants.dart';
import '../core/utils/snackbar_message/snackbar_message.dart';
import '../core/utils/toast_message/toast_message.dart';
import '../data/local/shared_prefs.dart';

class ApiChecker {
  static void checkApi(Response response, {bool getXSnackBar = false}) async {
    if (response.statusCode == 401) {
      toastMessage(
        message: response.body["message"],
      );
      await SharePrefsHelper.remove(AppConstants.bearerToken);

      await SharePrefsHelper.setBool(AppConstants.rememberMe, false);
    } else if (response.statusCode == 403) {
      toastMessage(
        message: response.body["message"],
      );
    } else {
      showCustomSnackBar(response.statusText, getXSnackBar: getXSnackBar);
    }
  }
}
