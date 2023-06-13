import 'package:campus/pages/main/cubit/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainNavigationBar extends StatelessWidget {
  const MainNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      buildWhen: (prev, next) => prev.pageSelector != next.pageSelector,
      builder: (context, state) => NavigationBar(
        onDestinationSelected: context.read<MainCubit>().changePageByIndex,
        selectedIndex: state.pageSelector.index,
        destinations: const [
          NavigationDestination(
            icon: Icon(FontAwesomeIcons.binoculars),
            label: 'Découvrir',
          ),
          NavigationDestination(
            icon: Icon(FontAwesomeIcons.wallet),
            label: 'Wallet',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Mon compte',
          ),
        ],
      ),
    );
  }
}
