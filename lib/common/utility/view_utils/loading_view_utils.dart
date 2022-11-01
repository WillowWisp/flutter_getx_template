import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoadingViewUtils {
  /// show loading and return the dialog
  static Future<void> showLoading({String message = 'Please wait...'}) async {
    // EasyLoading.instance
    //   ..backgroundColor = ThemeColorUtils.getOnSecondary(Get.overlayContext!)
    //   ..textColor = ThemeColorUtils.getSecondary(Get.overlayContext!);

    await EasyLoading.show(
      maskType: EasyLoadingMaskType.black,
    );
  }

  static Future<void> hideLoading() async {
    await EasyLoading.dismiss();
  }
}
