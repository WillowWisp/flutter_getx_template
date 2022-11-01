import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_getx_template/common/routes/app_pages.dart';
import 'package:flutter_getx_template/data_access/services/localization/localization_service.dart';
import 'package:flutter_getx_template/views/modules/pages/splash_page/splash_page_controller.dart';
import 'package:get/get.dart';

class SplashPageControllerImpl extends GetxController
    implements SplashPageController {
  final LocalizationService _localizationService;

  SplashPageControllerImpl({
    required LocalizationService localizationService,
  }) : _localizationService = localizationService;

  final Rx<int> _count = Rx(0);
  @override
  int get count => _count.value;

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  @override
  void toggleLanguage() {
    SupportedLanguage language;
    if (Get.context?.locale.languageCode == 'en') {
      language = SupportedLanguage.vi;
    } else {
      language = SupportedLanguage.en;
    }
    _localizationService.switchLanguage(language);
  }

  @override
  void increaseCount() {
    _count.value++;
  }
}
