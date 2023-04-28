import 'package:flutter/material.dart';

class DiscoverViewStory extends StatelessWidget {
  static const height = 150.0;

  const DiscoverViewStory({super.key});

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
            prototypeItem: const DiscoverViewStoryTile(),
            itemBuilder: (context, index) => const DiscoverViewStoryTile(),
          ),
        ),
      ),
    );
  }
}

class DiscoverViewStoryTile extends StatelessWidget {
  static const bubbleSize = 100.0;

  const DiscoverViewStoryTile({super.key});

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
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2,
                  color: Colors.red,
                ),
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://www.radiofrance.fr/s3/cruiser-production/2020/10/9ecbbc37-81fe-4ce0-af3b-c22f405c3092/1200x680_gettyimages-1135378306.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: InkWell(
                customBorder: const CircleBorder(),
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
