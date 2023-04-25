import 'package:campus/pages/main/main.dart';
import 'package:flutter/material.dart';

class MainView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Les reco',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const MainViewStory(),

          ],
        ),
      ),
    );
  }
}
