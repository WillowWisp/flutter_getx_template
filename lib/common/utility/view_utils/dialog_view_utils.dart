import 'package:get/get.dart';
import 'package:flutter_getx_template/common/widgets/app_dialog.dart';

class DialogViewUtils {
  static Future<bool> showConfirmDialog({
    String? titleText,
    required String messageText,
  }) async {
    final bool? isConfirmed = await Get.dialog<bool>(
      AppDialogYesNo(
        titleText: titleText ?? 'N/A',
        messageText: messageText,
        onYes: () {
          Get.back(result: true);
        },
      ),
    );

    return isConfirmed ?? false;
  }
}
