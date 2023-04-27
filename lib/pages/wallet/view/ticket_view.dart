import 'package:campus/pages/wallet/cubit/wallet_cubit.dart';
import 'package:campus/pages/wallet/view/wallet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TicketView extends StatelessWidget {
  const TicketView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      _showActualTickets(),
      _showPastTicketHeader(context),
      _showPastTickets(),
    ]);
  }

  Widget _showActualTickets() {
    return BlocBuilder<WalletCubit, WalletState>(
      builder: (context, state) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return WalletCard(
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
              );
            },
            childCount: 10,
          ),
        );
      },
    );
  }

  Widget _showPastTickets() {
    return BlocBuilder<WalletCubit, WalletState>(
      builder: (context, state) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final offsetIndex = index + 10;

              return WalletCard(
                title: const Text('Kfet de Noël'),
                subtitle: const Text('12 mars 2023 - 18h'),
                code: '4q4dqz4dqz524dqz654d',
                imageProvider: const NetworkImage(
                  'https://googleflutter.com/sample_image.jpg',
                ),
                expanded: offsetIndex == state.ticketExpandedIndex,
                onTap: offsetIndex == state.ticketExpandedIndex
                    ? null
                    : () =>
                        context.read<WalletCubit>().expandTicket(offsetIndex),
              );
            },
            childCount: 10,
          ),
        );
      },
    );
  }

  Widget _showPastTicketHeader(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 10),
        child: Text(
          'Tickets passés',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
