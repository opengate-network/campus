import 'package:campus/pages/main/main.dart';
import 'package:campus/pages/wallet/view/ticket_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        TicketCard(),
      ],
    );
  }
}
