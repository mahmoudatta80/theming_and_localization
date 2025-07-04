import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/core/themes/app_themes.dart';

class ChangeThemeCubit extends Cubit<ThemeData>{
  ChangeThemeCubit() : super(AppThemes.getLightTheme());

  void toggleTheme() {
    if (state == AppThemes.getLightTheme()) {
      emit(AppThemes.getDarkTheme());
    } else {
      emit(AppThemes.getLightTheme());
    }
  }
}