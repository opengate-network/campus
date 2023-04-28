import 'package:flutter/material.dart';
import 'discover_view_school_grid.dart';
import 'discover_view_story.dart';

class DiscoverView extends StatelessWidget {
  const DiscoverView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        //_EventViewAppbar(),
        DiscoverViewStory(),
        _DiscoverViewSegmentTitle(text: 'Cette semaine'),
        DiscoverViewSchoolList(),
        _DiscoverViewSegmentTitle(text: 'Par établissement'),
        DiscoverViewSchoolList(),
        _DiscoverViewSegmentTitle(text: 'Soirée'),
        DiscoverViewSchoolList(),
        _DiscoverViewSegmentTitle(text: 'Les bons plans'),
        DiscoverViewSchoolList(),
      ],
    );
  }
}

class _DiscoverViewSegmentTitle extends StatelessWidget {
  final String text;

  const _DiscoverViewSegmentTitle({super.key, required this.text});

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

