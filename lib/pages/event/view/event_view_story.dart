import 'package:flutter/material.dart';

class EventViewStory extends StatelessWidget {
  static const height = 150.0;

  const EventViewStory({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      sliver: SliverToBoxAdapter(
        child: SizedBox(
          height: height,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            prototypeItem: const EventViewStoryTile(),
            itemBuilder: (context, index) => const EventViewStoryTile(),
          ),
        ),
      ),
    );
  }
}

class EventViewStoryTile extends StatelessWidget {
  static const bubbleSize = 100.0;
  static final border = BorderRadius.circular(bubbleSize);

  const EventViewStoryTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          SizedBox(
            width: bubbleSize,
            height: bubbleSize,
            child: Ink(
              decoration: BoxDecoration(
                borderRadius: border,
                border: Border.all(
                  width: 2,
                  color: Colors.red,
                ),
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://www.radiofrance.fr/s3/cruiser-production/2020/10/9ecbbc37-81fe-4ce0-af3b-c22f405c3092/1200x680_gettyimages-1135378306.jpg'),
                  fit: BoxFit.fitHeight,
                ),
              ),
              child: InkWell(
                borderRadius: border,
                onTap: () {},
              ),
            ),
          ),
          const SizedBox(height: 5),
          const SizedBox(
            width: bubbleSize,
            child: Text(
              'Stranger Things : The Experience',
              overflow: TextOverflow.clip,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
