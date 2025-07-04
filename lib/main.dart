import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/functions/get_initial_app_settings.dart';
import 'core/logic/change_language_cubit/change_language_cubit.dart';
import 'core/logic/change_theme_cubit/change_theme_cubit.dart';
import 'features/home/ui/home_screen.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final settings = await getInitialAppSettings();
  runApp(MyApp(initialTheme: settings.theme, initialLanguage: settings.locale));
}

class MyApp extends StatelessWidget {
  final ThemeData initialTheme;
  final Locale initialLanguage;
  const MyApp({
    super.key,
    required this.initialTheme,
    required this.initialLanguage,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ChangeThemeCubit(initialTheme)),
        BlocProvider(create: (context) => ChangeLanguageCubit(initialLanguage)),
      ],
      child: BlocBuilder<ChangeLanguageCubit, Locale>(
        builder: (context, language) {
          return BlocBuilder<ChangeThemeCubit, ThemeData>(
            builder: (context, theme) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Training App',
                home: const HomeScreen(),
                theme: theme,
                themeAnimationCurve: Curves.easeInOut,
                themeAnimationDuration: const Duration(milliseconds: 500),
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                locale: language,
              );
            },
          );
        },
      ),
    );
  }
}
