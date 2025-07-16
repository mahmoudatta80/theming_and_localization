import 'package:flutter/material.dart';
import 'package:training_app/core/themes/dark_theme.dart';
import 'package:training_app/core/themes/light_theme.dart';

abstract class AppThemes {
  static ThemeData getLightTheme() => lightTheme;
  static ThemeData getDarkTheme() => darkTheme;
}
