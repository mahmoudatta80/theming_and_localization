import 'package:flutter/material.dart';

import '../helper/app_shared_preferences.dart';
import '../utils/app_themes.dart';
import '../utils/app_constants.dart';
import '../utils/app_languages.dart';

Future<({ThemeData theme, Locale locale})> getInitialAppSettings() async {
  final deviceLocale = WidgetsBinding.instance.platformDispatcher.locale;

  final deviceBrightness =
      WidgetsBinding.instance.platformDispatcher.platformBrightness;
  final isDeviceModeDark = deviceBrightness == Brightness.dark;

  await AppSharedPreferences.init();

  final isDarkMode =
      AppSharedPreferences.getData(AppConstants.isDarkModeKey) as bool? ??
      isDeviceModeDark;
  final theme = isDarkMode
      ? AppThemes.getDarkTheme()
      : AppThemes.getLightTheme();

  final languageCode =
      AppSharedPreferences.getData(AppConstants.languageKey) as String? ??
      deviceLocale.languageCode;
  final locale = languageCode == 'en'
      ? AppLanguages.getEnglishLocale()
      : AppLanguages.getArabicLocale();

  return (theme: theme, locale: locale);
}
