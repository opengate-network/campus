import 'package:flutter/material.dart';

import 'event_buy_fab.dart';
import 'event_view.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EventView(),
      floatingActionButton: EventBuyFAB(),
    );
  }
}
