import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit()
      : super(const WalletState(
          ticketExpandedIndex: 0,
          subscriptionExpandedIndex: 0,
        ));

  void expandTicket(int index) {
    emit(state.copyWith(ticketExpandedIndex: index));
  }

  void expandSubscription(int index) {
    emit(state.copyWith(subscriptionExpandedIndex: index));
  }
}
