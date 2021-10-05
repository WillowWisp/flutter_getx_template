import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/data_access/services/localization/localization_service.dart';
import 'package:get/get.dart';

class LocalizationServiceImpl implements LocalizationService {
  @override
  void switchLanguage(SupportedLanguage language) {
    final Locale foundLocale = language.getLocale();

    final context = Get.context;

    if (context == null) {
      throw Exception('CUSTOM: Cannot find context');
    }

    context.setLocale(foundLocale);
    Get.updateLocale(foundLocale);
  }
}
