import 'dart:ui';

abstract class LocalizationService {
  void switchLanguage(SupportedLanguage language);
}

enum SupportedLanguage {
  en,
  vi,
}

extension SupportedLanguageExt on SupportedLanguage {
  Locale getLocale() {
    switch (this) {
      case SupportedLanguage.en:
        return Locale('en');
      case SupportedLanguage.vi:
        return Locale('vi');
    }
  }
}
