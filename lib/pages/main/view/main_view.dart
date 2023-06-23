import 'package:campus/pages/account/account.dart';
import 'package:campus/pages/discover/discover.dart';
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
        return const DiscoverView();
      case MainPageSelector.wallet:
        return const WalletView();
      case MainPageSelector.account:
        return const AccountPage();
    }
  }

  List<Widget> getActionFromSelector(MainPageSelector selector) {
    List<Widget> actions = [];
    if (selector == MainPageSelector.event) {
      actions.add(
        Badge(
          label: Text('20'),
          offset: const Offset(-10, 10),
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
            icon: Icon(FontAwesomeIcons.ticket),
            text: 'Tickets',
          ),
          Tab(
            icon: Icon(FontAwesomeIcons.peopleGroup),
            text: 'Cotisations',
          ),
        ],
      );
    }
    return null;
  }
}

class MainAppbarLogo extends StatelessWidget {
  const MainAppbarLogo({
    super.key,
    this.width = 180,
    this.opacity,
  });

  final double? width;
  final Animation<double>? opacity;

  @override
  Widget build(BuildContext context) {
    return Image(
      width: width,
      opacity: opacity,
      image: AssetImage(
        MediaQuery.of(context).platformBrightness == Brightness.light
            ? 'assets/logos/opengate_logo_light.png'
            : 'assets/logos/opengate_logo_dark.png',
      ),
    );
  }
}
