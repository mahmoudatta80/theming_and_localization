import 'package:flutter/material.dart';

import 'core/functions/get_initial_app_settings.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final settings = await getInitialAppSettings();
  runApp(MyApp(initialTheme: settings.theme, initialLanguage: settings.locale));
}
