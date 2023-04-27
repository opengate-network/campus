import 'package:campus/pages/wallet/view/subscription_view.dart';
import 'package:campus/pages/wallet/view/ticket_view.dart';
import 'package:flutter/material.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [
        TicketView(),
        SubscriptionView(),
      ],
    );
  }
}
