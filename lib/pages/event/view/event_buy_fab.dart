import 'package:flutter/material.dart';

class EventBuyFAB extends StatelessWidget {
  const EventBuyFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {},
      icon: const Icon(Icons.add_shopping_cart),
      label: const Text('Acheter une place'),
    );
  }
}
