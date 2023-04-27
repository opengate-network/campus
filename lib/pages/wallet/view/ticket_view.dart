import 'package:campus/pages/wallet/view/wallet_widget.dart';
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class TicketView extends StatelessWidget {
  const TicketView({super.key});

  static const card = WalletCard(
    showQRCode: true,
    title: Text('Kfet de Noël'),
    subtitle: Text('12 mars 2023 - 18h'),
    code: '4q4dqz4dqz524dqz654d',
    imageProvider: NetworkImage('https://googleflutter.com/sample_image.jpg'),
  );
  static const card2 = WalletCard(
    title: Text('Kfet de Noël'),
    subtitle: Text('12 mars 2023 - 18h'),
    code: '4q4dqz4dqz524dqz654d',
    imageProvider: NetworkImage('https://googleflutter.com/sample_image.jpg'),

  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          card,
          card2,
          card2,
          card2,
          card2,
        ],
      ),
    );
  }
}
