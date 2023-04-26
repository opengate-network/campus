import 'package:campus/pages/event/view/view.dart';
import 'package:campus/pages/main/cubit/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        switch(state.pageSelector){
          case MainPageSelector.event:
            return const EventView();
          case MainPageSelector.account:
            return const SizedBox();
        }
      },
    );
  }
}
