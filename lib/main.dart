import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/core/logic/change_theme_cubit/change_theme_cubit.dart';
import 'package:training_app/features/home/ui/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangeThemeCubit(),
      child: BlocBuilder<ChangeThemeCubit, ThemeData>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Training App',
            theme: state,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
