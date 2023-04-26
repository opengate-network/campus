import 'package:campus/pages/event/event.dart';
import 'package:campus/pages/main/cubit/main_cubit.dart';
import 'package:campus/pages/wallet/wallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'main_navigation_bar.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        final selector = state.pageSelector;
        final tabBar = getTabBarFromSelector(selector);

        return DefaultTabController(
          length: tabBar?.tabs.length ?? 0,
          child: Scaffold(
            appBar: AppBar(
              title: const MainAppbarLogo(),
              actions: getActionFromSelector(selector),
              bottom: tabBar,
            ),
            body: getPageFromSelector(selector),
            bottomNavigationBar: const MainNavigationBar(),
          ),
        );
      },
    );
  }

  Widget getPageFromSelector(MainPageSelector selector) {
    switch (selector) {
      case MainPageSelector.event:
        return const EventView();
      case MainPageSelector.wallet:
        return const WalletView();
      case MainPageSelector.account:
        return const SizedBox();
    }
  }

  List<Widget> getActionFromSelector(MainPageSelector selector) {
    List<Widget> actions = [];
    if (selector == MainPageSelector.event) {
      actions.add(
        Badge(
          alignment: AlignmentDirectional.center,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.bell),
          ),
        ),
      );
    }
    return actions;
  }

  TabBar? getTabBarFromSelector(MainPageSelector selector) {
    if (selector == MainPageSelector.wallet) {
      return const TabBar(
        tabs: [
          Tab(
            icon: Icon(Icons.cloud_outlined),
          ),
          Tab(
            icon: Icon(Icons.beach_access_sharp),
          ),
          Tab(
            icon: Icon(Icons.brightness_5_sharp),
          ),
        ],
      );
    }
    return null;
  }
}

class MainAppbarLogo extends StatelessWidget {
  const MainAppbarLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image(
      width: 180,
      image: AssetImage(
        MediaQuery.of(context).platformBrightness == Brightness.light
            ? 'assets/logos/opengate_logo_light.png'
            : 'assets/logos/opengate_logo_dark.png',
      ),
    );
  }
}
