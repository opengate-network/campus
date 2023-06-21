import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class EventView extends StatelessWidget {
  EventView({super.key});

  final MapController controller = MapController(
    initMapWithUserPosition: const UserTrackingOption(enableTracking: true),
  );

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _createAppBar(),
        _showEventInfo(context),
        _showMap(),
      ],
    );
  }

  Widget _createAppBar() {
    return const SliverAppBar(
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        title: Text('Kfet de Noël'),
        background: Image(
          fit: BoxFit.cover,
          image: NetworkImage(
            'https://googleflutter.com/sample_image.jpg',
          ),
        ),
      ),
      pinned: true,
    );
  }

  Widget _showEventInfo(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Par le BDE ESIEE Paris',
              style: textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _showMap() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 300,
        child: OSMFlutter(
          controller: controller,
          showZoomController: true,
          initZoom: 16,
          minZoomLevel: 8,
          maxZoomLevel: 19,
          stepZoom: 1.0,
        ),
      ),
    );
  }
}
