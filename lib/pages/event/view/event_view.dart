import 'package:flutter/material.dart';
import 'event_view_school_grid.dart';
import 'event_view_story.dart';

class EventView extends StatelessWidget {
  const EventView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        //_EventViewAppbar(),
        EventViewStory(),
        _EventViewSegmentTitle(text: 'Cette semaine'),
        EventViewSchoolList(),
        _EventViewSegmentTitle(text: 'Par établissement'),
        EventViewSchoolList(),
        _EventViewSegmentTitle(text: 'Soirée'),
        EventViewSchoolList(),
        _EventViewSegmentTitle(text: 'Les bons plans'),
        EventViewSchoolList(),
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
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 10),
      sliver: SliverToBoxAdapter(
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleSmall?.merge(
              const TextStyle(fontWeight: FontWeight.w500, fontSize: 17)),
        ),
      ),
    );
  }
}

