import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../helper/app_shared_preferences.dart';
import '../../utils/app_constants.dart';

class ChangeLanguageCubit extends Cubit<Locale> {
  final Locale initialLocale;
  ChangeLanguageCubit(this.initialLocale) : super(initialLocale);

  void toggleLanguage(Locale locale) {
    emit(locale);
    _cacheLanguageCode(locale.languageCode);
  }

  void _cacheLanguageCode(String languageCode) async {
    await AppSharedPreferences.setData(
      key: AppConstants.languageKey,
      value: languageCode,
    );
  }
}
