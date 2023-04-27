import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class WalletFullscreen extends StatelessWidget {
  const WalletFullscreen({
    super.key,
    required this.body,
    required this.header,
  });

  final Widget body;
  final Widget header;

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: Scaffold(
        appBar: AppBar(title: header),
        body: body,
      ),
    );
  }
}

class WalletTileHeader extends StatelessWidget {
  const WalletTileHeader({
    super.key,
    required this.imageProvider,
    required this.text,
    this.organizationIconSize = 30,
  });

  final ImageProvider<Object> imageProvider;
  final Widget text;
  final double organizationIconSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Row(
      children: [
        Container(
          width: organizationIconSize,
          height: organizationIconSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(width: 15),
        AnimatedDefaultTextStyle(
          style: theme.bodyLarge!.merge(
            const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          duration: kThemeChangeDuration,
          child: text,
        ),
      ],
    );
  }
}

class WalletTileBodyWithQRCode extends StatelessWidget {
  const WalletTileBodyWithQRCode({
    super.key,
    this.centered = false,
    required this.title,
    required this.subtitle,
    required this.code,
  });

  final bool centered;

  final Widget title;
  final Widget subtitle;
  final String code;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    final qrcodeWidget = Center(
      child: WalletQRCode(
        code: code,
        size: centered ? 300.0 : null,
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedDefaultTextStyle(
                  style: theme.titleLarge!,
                  duration: kThemeChangeDuration,
                  child: title,
                ),
                AnimatedDefaultTextStyle(
                  style: theme.labelMedium!,
                  duration: kThemeChangeDuration,
                  child: subtitle,
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

class WalletQRCode extends StatelessWidget {
  const WalletQRCode({
    super.key,
    required this.code,
    this.size,
  });

  final String code;
  final double? size;

  static const double defaultSize = 200.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? defaultSize,
      height: size ?? defaultSize,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      child: PrettyQr(
        size: size ?? defaultSize,
        data: 'og-campus://check-ticket/$code',
      ),
    );
  }
}

class WalletTileSimpleBody extends StatelessWidget {
  const WalletTileSimpleBody({
    super.key,
    this.organizationIconSize = 30,
    required this.imageProvider,
    required this.title,
    required this.subtitle,
  });

  final double organizationIconSize;
  final ImageProvider<Object> imageProvider;
  final Widget title;
  final Widget subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: organizationIconSize,
            height: organizationIconSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedDefaultTextStyle(
                style: theme.bodyLarge!.merge(
                  const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                duration: kThemeChangeDuration,
                child: title,
              ),
              AnimatedDefaultTextStyle(
                style: theme.labelLarge!.merge(
                  const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                duration: kThemeChangeDuration,
                child: subtitle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class WalletCard extends StatelessWidget {
  const WalletCard({
    super.key,
    this.showQRCode = false,
    required this.title,
    required this.subtitle,
    required this.code,
    required this.imageProvider,
  });

  final bool showQRCode;

  final Widget title;
  final Widget subtitle;
  final ImageProvider<Object> imageProvider;
  final String code;

  static const cardShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(30),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final walletTileHeader = WalletTileHeader(
      imageProvider: imageProvider,
      text: title,
    );

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        color: Theme.of(context).colorScheme.surfaceVariant,
        shape: cardShape,
        child: InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (_) => WalletFullscreen(
                body: WalletTileBodyWithQRCode(
                  title: title,
                  subtitle: subtitle,
                  code: code,
                  centered: true,
                ),
                header: walletTileHeader,
              ),
            );
          },
          customBorder: cardShape,
          child: Column(
            children: showQRCode
                ? [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: walletTileHeader,
                    ),
                    WalletTileBodyWithQRCode(
                      title: title,
                      subtitle: subtitle,
                      code: code,
                    ),
                  ]
                : [
                    WalletTileSimpleBody(
                      imageProvider: imageProvider,
                      title: title,
                      subtitle: subtitle,
                      organizationIconSize: 45,
                    ),
                  ],
          ),
        ),
      ),
    );
  }
}
