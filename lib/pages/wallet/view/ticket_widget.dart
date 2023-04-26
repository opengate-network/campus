import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class TicketCard extends StatelessWidget {
  const TicketCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(10),
      sliver: SliverToBoxAdapter(
        child: Card(
          color: Theme.of(context).colorScheme.surfaceVariant,
          shape: TicketWidget.cardShape,
          child: InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => const TicketFullscreen(),
              );
            },
            customBorder: TicketWidget.cardShape,
            child: const TicketWidget(showHeader: true),
          ),
        ),
      ),
    );
  }
}

class TicketFullscreen extends StatelessWidget {
  const TicketFullscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Dialog.fullscreen(
      child: Scaffold(
        appBar: AppBar(
          title: const TicketHeader(),
        ),
        body: const TicketWidget(
          showHeader: false,
          centered: true,
        ),
      ),
    );
  }
}

class TicketHeader extends StatelessWidget {
  const TicketHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Row(
      children: [
        Container(
          width: TicketWidget.orgIconSize,
          height: TicketWidget.orgIconSize,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage('https://googleflutter.com/sample_image.jpg'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(width: 15),
        Text(
          'BDE ESIEE Paris',
          style: theme.bodyLarge?.merge(
            const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class TicketWidget extends StatelessWidget {
  const TicketWidget({
    super.key,
    this.showHeader = true,
    this.centered = false,
  });

  final bool showHeader;
  final bool centered;

  static const double orgIconSize = 30;

  static const cardShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(orgIconSize),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    const qrcodeWidget = Center(
      child: TicketQRCode(
        code: 'uc2emaezuut5Thiechaebeing2faw6so',
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showHeader)
            const Padding(
              padding: EdgeInsets.all(15),
              child: TicketHeader(),
            ),
          Divider(
            color: Theme.of(context).colorScheme.inverseSurface,
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            child: Column(
              children: [
                Text(
                  'Kfet de Noël',
                  style: theme.titleLarge,
                ),
                Text(
                  'Lundi 6 mars - 18h00',
                  style: theme.labelMedium,
                ),
              ],
            ),
          ),
          centered ? Expanded(child: qrcodeWidget) : qrcodeWidget,
        ],
      ),
    );
  }
}

class TicketQRCode extends StatelessWidget {
  const TicketQRCode({super.key, required this.code});

  final String code;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      child: PrettyQr(
        size: 200,
        data: 'og-campus://check-ticket/$code',
      ),
    );
  }
}
