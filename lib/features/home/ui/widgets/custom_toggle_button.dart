import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/core/themes/app_themes.dart';

import '../../../../core/logic/change_theme_cubit/change_theme_cubit.dart';

class CustomToggleButton extends StatelessWidget {
  const CustomToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.read<ChangeThemeCubit>().toggleTheme();
      },
      child: BlocBuilder<ChangeThemeCubit, ThemeData>(
        builder: (context, state) {
          return state == AppThemes.getLightTheme()
              ? const Icon(Icons.dark_mode)
              : const Icon(Icons.light_mode);
        },
      ),
    );
  }
}
