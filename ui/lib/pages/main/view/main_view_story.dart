import 'package:flutter/material.dart';

class MainViewStory extends StatelessWidget {
  static const height = 200.0;

  const MainViewStory({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        prototypeItem: MainViewStoryTile(),
        itemBuilder: (context, index) => MainViewStoryTile(),
      ),
    );
  }
}

class MainViewStoryTile extends StatelessWidget {
  static const bubbleSize = 120.0;
  static final border = BorderRadius.circular(bubbleSize);

  const MainViewStoryTile({super.key});

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
          SizedBox(
            width: bubbleSize,
            child: Text(
              'Stranger Things : The Experience',
              overflow: TextOverflow.clip,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
