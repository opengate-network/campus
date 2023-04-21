import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';

class MainView extends StatelessWidget {
  final controller = InfiniteScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recommandé pour vous',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(
          height: 200,
          child: InfiniteCarousel.builder(
            itemCount: 10,
            itemExtent: 250,
            onIndexChanged: (index) {},
            axisDirection: Axis.horizontal,
            loop: false,
            controller: controller,
            itemBuilder: (context, itemIndex, realIndex) {
              return RecoTile();
            },
          ),
        ),
      ],
    );
  }
}

class RecoTile extends StatelessWidget {
  static final border = BorderRadius.circular(5);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: border,
      ),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: border,
          image: const DecorationImage(
            image: NetworkImage(
                'https://www.radiofrance.fr/s3/cruiser-production/2020/10/9ecbbc37-81fe-4ce0-af3b-c22f405c3092/1200x680_gettyimages-1135378306.jpg'),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: InkWell(
          borderRadius: border,
          onTap: () {},
          child: Container(
            alignment: AlignmentDirectional.bottomStart,
            child: ListTile(
              title: Text(
                'Kfet',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.merge(const TextStyle(
                      color: Colors.white,
                    )),
              ),
              subtitle: Text(
                'BDE ESIEE Paris',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
