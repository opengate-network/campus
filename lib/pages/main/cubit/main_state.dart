part of 'main_cubit.dart';

enum MainPageSelector {
  event,
  wallet,
  account,
}

class MainState extends Equatable {
  final MainPageSelector pageSelector;

  const MainState({
    this.pageSelector = MainPageSelector.event,
  });

  @override
  List<Object?> get props => [pageSelector];

  MainState copyWith({
    MainPageSelector? pageSelector,
  }) =>
      MainState(
        pageSelector: pageSelector ?? this.pageSelector,
      );
}
