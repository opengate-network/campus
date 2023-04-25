import 'package:flutter/material.dart';

import 'event_view_story.dart';

class EventView extends StatelessWidget {
  const EventView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                'Les recos',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const EventViewStory(),
          ],
        ),
      ),
    );
  }
}
