part of 'wallet_cubit.dart';

class WalletState extends Equatable {
  const WalletState({
    required this.ticketExpandedIndex,
    required this.subscriptionExpandedIndex,
  });

  final int ticketExpandedIndex;
  final int subscriptionExpandedIndex;

  @override
  List<Object?> get props => [
        ticketExpandedIndex,
        subscriptionExpandedIndex,
      ];

  WalletState copyWith({
    int? ticketExpandedIndex,
    int? subscriptionExpandedIndex,
  }) =>
      WalletState(
        ticketExpandedIndex: ticketExpandedIndex ?? this.ticketExpandedIndex,
        subscriptionExpandedIndex:
            subscriptionExpandedIndex ?? this.subscriptionExpandedIndex,
      );
}
