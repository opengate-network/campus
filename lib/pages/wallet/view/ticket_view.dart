import 'package:campus/pages/wallet/cubit/wallet_cubit.dart';
import 'package:campus/pages/wallet/view/wallet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class TicketView extends StatelessWidget {
  const TicketView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<WalletCubit, WalletState>(
        builder: (context, state) {
          return Column(
            children: List.generate(
              10,
              (index) => WalletCard(
                title: const Text('Kfet de Noël'),
                subtitle: const Text('12 mars 2023 - 18h'),
                code: '4q4dqz4dqz524dqz654d',
                imageProvider: const NetworkImage(
                  'https://googleflutter.com/sample_image.jpg',
                ),
                expanded: index == state.ticketExpandedIndex,
                onTap: index == state.ticketExpandedIndex
                    ? null
                    : () => context.read<WalletCubit>().expandTicket(index),

              ),
            ),
          );
        },
      ),
    );
  }
}
