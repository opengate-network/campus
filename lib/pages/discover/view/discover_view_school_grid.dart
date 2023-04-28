import 'package:flutter/material.dart';

class DiscoverViewSchoolGrid extends StatelessWidget {
  const DiscoverViewSchoolGrid({super.key});

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
            return const DiscoverViewSchoolGridTile();
          },
        ),
      ),
    );
  }
}

class DiscoverViewSchoolGridTile extends StatelessWidget {
  static const size = 50.0;

  const DiscoverViewSchoolGridTile({super.key});

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

class DiscoverViewSchoolList extends StatelessWidget {
  static const height = 205.0;

  const DiscoverViewSchoolList({super.key});

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
            prototypeItem: const DiscoverViewSchoolListTile(),
            itemBuilder: (context, index) => const DiscoverViewSchoolListTile(),
          ),
        ),
      ),
    );
  }
}

class DiscoverViewSchoolListTile extends StatelessWidget {
  static const size = 145.0;

  const DiscoverViewSchoolListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        //color: Theme.of(context).colorScheme.surfaceVariant,
        child: Container(
          decoration: BoxDecoration(
            color: CardTheme.of(context).color,
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Ink(
                  width: size,
                  height: size-8,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/logos/components/esiee.png')),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        'ESIEE Paris',
                        style: Theme.of(context).textTheme.headlineSmall?.merge(
                              const TextStyle(
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
