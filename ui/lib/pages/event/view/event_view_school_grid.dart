import 'package:flutter/material.dart';

class EventViewSchoolGrid extends StatelessWidget {
  const EventViewSchoolGrid({super.key});

  static const spacing = 10.0;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: spacing,
          crossAxisSpacing: spacing,
        ),
        delegate: SliverChildBuilderDelegate(
          childCount: 100,
          (BuildContext context, int index) {
            return const EventViewSchoolGridTile();
          },
        ),
      ),
    );
  }
}

class EventViewSchoolGridTile extends StatelessWidget {
  static const size = 50.0;

  const EventViewSchoolGridTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(5),
      color: Colors.white,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.scaleDown,
            image: NetworkImage(
                'https://www.usinenouvelle.com/mediatheque/4/3/0/000271034_image_600x315.jpg'),
          ),
        ),
      ),
    );
  }
}
