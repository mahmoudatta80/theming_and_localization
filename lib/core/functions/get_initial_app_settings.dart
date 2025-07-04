import 'package:flutter/material.dart';

import '../helper/app_shared_preferences.dart';
import '../themes/app_themes.dart';
import '../utils/app_constants.dart';
import '../utils/app_languages.dart';

Future<({ThemeData theme, Locale locale})> getInitialAppSettings() async {
  await AppSharedPreferences.init();

  final isDarkMode =
      await AppSharedPreferences.getData(AppConstants.isDarkModeKey) as bool? ??
      false;
  final theme = isDarkMode
      ? AppThemes.getDarkTheme()
      : AppThemes.getLightTheme();

  final languageCode =
      await AppSharedPreferences.getData(AppConstants.languageKey) as String?;
  final locale = languageCode == 'ar'
      ? AppLanguages.getArabicLocale()
      : AppLanguages.getEnglishLocale();

  return (theme: theme, locale: locale);
}
