import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/logic/change_language_cubit/change_language_cubit.dart';
import '../../../../core/utils/app_languages.dart';

class LanguageToggleButton extends StatelessWidget {
  const LanguageToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        final currentLocale = context.read<ChangeLanguageCubit>().state;
        final newLocale = currentLocale == AppLanguages.getArabicLocale()
            ? AppLanguages.getEnglishLocale()
            : AppLanguages.getArabicLocale();
        context.read<ChangeLanguageCubit>().toggleLanguage(newLocale);
      },
      child: BlocBuilder<ChangeLanguageCubit, Locale>(
        builder: (context, state) {
          return state == AppLanguages.getArabicLocale()
              ? const Icon(Icons.language)
              : const Icon(Icons.translate);
        },
      ),
    );
  }
}
