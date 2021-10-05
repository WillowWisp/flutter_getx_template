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

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();

    await Future.delayed(Duration(milliseconds: 500));
    Get.toNamed(AppRoutes.productList);
  }

  @override
  Future<void> onClose() async {
    super.onClose();
  }

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
