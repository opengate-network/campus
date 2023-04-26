import 'package:campus/pages/main/cubit/main_cubit.dart';
import 'package:campus/pages/main/view/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'main_appbar.dart';
import 'main_navigation_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: MainPage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MainCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const MainAppbarLogo(),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.bell),
            )
          ],
        ),
        body: const MainView(),
        bottomNavigationBar: const MainNavigationBar(),
      ),
    );
  }
}
