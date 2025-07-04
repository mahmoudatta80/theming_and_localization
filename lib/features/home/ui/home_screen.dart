import 'package:flutter/material.dart';
import 'package:training_app/features/home/ui/widgets/language_toggle_button.dart';

import '../../../generated/l10n.dart';
import 'widgets/theme_toggle_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).homeScreen), centerTitle: true),
      body: Center(child: Text(S.of(context).welcomeToMyHomeScreen)),
      floatingActionButton: const Column(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [ThemeToggleButton(), LanguageToggleButton()],
      ),
    );
  }
}
