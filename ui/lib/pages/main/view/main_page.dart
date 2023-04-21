import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: MainPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main'),
      ),
    );
  }
}
