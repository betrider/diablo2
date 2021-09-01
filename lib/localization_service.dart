import 'dart:ui';

import 'package:get/get.dart';

import 'lang/en_us.dart';
import 'lang/ko_kr2.dart';
import 'lang/ko_kr.dart';

class LocalizationService extends Translations {
  // Default locale
  static final locale = Locale('ko', 'KR');

  // fallbackLocale saves the day when the locale gets in trouble
  static final fallbackLocale = Locale('ko', 'KR');

  // Supported languages
  // Needs to be same order with locales
  static final langs = [
    '완역',
    '음역',
    'English',
  ];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    Locale('ko', 'KR'),
    Locale('ko', 'KR2'),
    Locale('en', 'US'),
  ];

  // Keys and their translations
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
        'ko_KR': koKR,
        'ko_KR2': koKR2,
        'en_US': enUS,
      };

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale);
  }

  // Finds language in `langs` list and returns it as Locale
  Locale _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale!;
  }
}
