import 'package:flutter/material.dart';

import 'widgets/custom_toggle_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen'), centerTitle: true),
      body: const Center(child: Text('Welcome to the Home Screen!')),
      floatingActionButton: const CustomToggleButton(),
    );
  }
}
