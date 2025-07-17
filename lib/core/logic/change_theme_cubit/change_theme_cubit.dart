import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/core/utils/app_themes.dart';
import 'package:training_app/core/helper/app_shared_preferences.dart';
import 'package:training_app/core/utils/app_constants.dart';

class ChangeThemeCubit extends Cubit<ThemeData> {
  final ThemeData initialTheme;
  ChangeThemeCubit(this.initialTheme) : super(initialTheme) {
    WidgetsBinding
        .instance
        .platformDispatcher
        .onPlatformBrightnessChanged = () {
      if (AppSharedPreferences.getData(AppConstants.isDarkModeKey) == null) {
        setDeviceTheme();
      }
    };
  }

  void toggleTheme(ThemeData theme) {
    emit(theme);
    _cacheTheme(theme);
  }

  void setDeviceTheme() {
    final deviceBrightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    final deviceTheme = deviceBrightness == Brightness.dark
        ? AppThemes.getDarkTheme()
        : AppThemes.getLightTheme();
    emit(deviceTheme);
  }

  void _cacheTheme(ThemeData theme) async {
    await AppSharedPreferences.setData(
      key: AppConstants.isDarkModeKey,
      value: theme == AppThemes.getDarkTheme(),
    );
  }
}
