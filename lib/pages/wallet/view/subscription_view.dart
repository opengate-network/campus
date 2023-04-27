import 'package:campus/pages/wallet/cubit/wallet_cubit.dart';
import 'package:campus/pages/wallet/view/wallet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubscriptionView extends StatelessWidget {
  const SubscriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletCubit, WalletState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return WalletCard(
              title: const Text('BDE ESIEE Paris'),
              subtitle: const Text('Cotisation temps-plein annuelle'),
              code: '4q4dqz4dqz524dqz654d',
              imageProvider: const NetworkImage(
                  'https://googleflutter.com/sample_image.jpg'),
              expanded: index == state.subscriptionExpandedIndex,
              onTap: index == state.subscriptionExpandedIndex
                  ? null
                  : () => context.read<WalletCubit>().expandSubscription(index),
            );
          },
        );
      },
    );
  }
}
