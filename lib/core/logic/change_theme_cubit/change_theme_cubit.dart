import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/core/themes/app_themes.dart';
import 'package:training_app/core/helper/app_shared_preferences.dart';
import 'package:training_app/core/utils/app_constants.dart';

class ChangeThemeCubit extends Cubit<ThemeData> {
  final ThemeData initialTheme;
  ChangeThemeCubit(this.initialTheme) : super(initialTheme);

  void toggleTheme(ThemeData theme) {
    emit(theme);
    _cacheTheme(theme);
  }

  void _cacheTheme(ThemeData theme) async {
    await AppSharedPreferences.setData(
      key: AppConstants.isDarkModeKey,
      value: theme == AppThemes.getDarkTheme(),
    );
  }
}
