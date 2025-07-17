import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/core/helper/app_shared_preferences.dart';
import 'package:training_app/core/utils/app_constants.dart';

import '../../../core/logic/change_language_cubit/change_language_cubit.dart';
import '../../../core/logic/change_theme_cubit/change_theme_cubit.dart';
import '../../../core/utils/app_languages.dart';
import '../../../core/utils/app_themes.dart';
import '../../../generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).homeScreen), centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              Text(S.of(context).welcomeToMyHomeScreen),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        final currentTheme = context
                            .read<ChangeThemeCubit>()
                            .state;
                        final newTheme =
                            currentTheme == AppThemes.getLightTheme()
                            ? AppThemes.getDarkTheme()
                            : AppThemes.getLightTheme();
                        context.read<ChangeThemeCubit>().toggleTheme(newTheme);
                      },
                      child: Text(S.of(context).toggleTheme),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        final currentLocale = context
                            .read<ChangeLanguageCubit>()
                            .state;
                        final newLocale =
                            currentLocale == AppLanguages.getArabicLocale()
                            ? AppLanguages.getEnglishLocale()
                            : AppLanguages.getArabicLocale();
                        context.read<ChangeLanguageCubit>().toggleLanguage(
                          newLocale,
                        );
                      },
                      child: Text(S.of(context).toggleLanguage),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () async {
                        context.read<ChangeThemeCubit>().setDeviceTheme();
                        await AppSharedPreferences.removeData(
                          AppConstants.isDarkModeKey,
                        );
                      },
                      child: Text(S.of(context).setDeviceTheme),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextButton(
                      onPressed: () async {
                        context.read<ChangeLanguageCubit>().setDeviceLanguage();
                        await AppSharedPreferences.removeData(
                          AppConstants.languageKey,
                        );
                      },
                      child: Text(S.of(context).setDeviceLanguage),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
