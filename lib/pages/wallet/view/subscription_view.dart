import 'package:campus/pages/wallet/view/wallet_widget.dart';
import 'package:flutter/material.dart';

class SubscriptionView extends StatelessWidget {
  const SubscriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return const WalletCard(
          title: Text('BDE ESIEE Paris'),
          subtitle: Text('Cotisation temps-plein annuelle'),
          code: '4q4dqz4dqz524dqz654d',
          imageProvider:
              NetworkImage('https://googleflutter.com/sample_image.jpg'),
        );
      },
    );
  }
}