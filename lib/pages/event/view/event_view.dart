import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
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
              'Par BDE ESIEE Paris',
              style: textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            const MarkdownBody(
              data: """
# The standard Lorem Ipsum passage, used since the 1500s
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

# Section 1.10.32 of "de Finibus Bonorum et Malorum", written by Cicero in 45 BC
"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"
""",
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
