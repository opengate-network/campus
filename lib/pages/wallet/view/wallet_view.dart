import 'package:campus/pages/wallet/cubit/wallet_cubit.dart';
import 'package:campus/pages/wallet/view/subscription_view.dart';
import 'package:campus/pages/wallet/view/ticket_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WalletCubit(),
      child: const TabBarView(
        children: [
          TicketView(),
          SubscriptionView(),
        ],
      ),
    );
  }
}
