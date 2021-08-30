import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/data/services/localization/localization_service.dart';
import 'package:get/get.dart';

const Map<SupportedLanguage, Locale> _languageWithLocalMap = {
  SupportedLanguage.en: Locale('en'),
  SupportedLanguage.vi: Locale('vi'),
};

class LocalizationServiceImpl implements LocalizationService {
  @override
  void switchLanguage(SupportedLanguage language) {
    final Locale foundLocale = _languageWithLocalMap[language] ?? Locale('en');

    final context = Get.context;

    if (context == null) {
      throw Exception('CUSTOM: Cannot find context');
    }

    context.setLocale(foundLocale);
    Get.updateLocale(foundLocale);
  }
}
