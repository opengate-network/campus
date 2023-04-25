import 'package:campus/pages/main/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'event_view_school_grid.dart';
import 'event_view_story.dart';

class EventView extends StatelessWidget {
  const EventView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        _EventViewAppbar(),
        _EventViewSegmentTitle(text: 'Pour vous'),
        EventViewStory(),
        _EventViewSegmentTitle(text: 'Par composante'),
        EventViewSchoolGrid(),
      ],
    );
  }
}

class _EventViewAppbar extends StatelessWidget {
  const _EventViewAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: const MainAppbarLogo(),
      floating: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(FontAwesomeIcons.bell),
        )
      ],
    );
  }
}

class _EventViewSegmentTitle extends StatelessWidget {
  final String text;

  const _EventViewSegmentTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 5, top: 10),
      sliver: SliverToBoxAdapter(
        child: Text(
          text,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
