import 'package:campus/pages/main/cubit/main_cubit.dart';
import 'package:campus/pages/main/view/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_navigation_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: MainPage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MainCubit(),
      child: const Scaffold(
        body: MainView(),
        bottomNavigationBar: MainNavigationBar(),
      ),
    );
  }
}
