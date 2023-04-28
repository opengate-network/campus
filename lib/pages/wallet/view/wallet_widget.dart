import 'package:campus/app/app.dart';
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:screen_brightness/screen_brightness.dart';

class WalletFullscreen extends StatefulWidget {
  const WalletFullscreen({
    super.key,
    this.organizationIconSize = 30,
    required this.imageProvider,
    required this.title,
    required this.subtitle,
    required this.code,
  });

  final String code;
  final Widget title;
  final Widget subtitle;
  final ImageProvider<Object> imageProvider;

  final double organizationIconSize;

  @override
  State<WalletFullscreen> createState() => _WalletFullscreenState();
}

class _WalletFullscreenState extends State<WalletFullscreen> with RouteAware {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      routeObserver.subscribe(this, ModalRoute.of(context)!);
    });
    super.initState();
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPop() {
    super.didPop();
    ScreenBrightness().resetScreenBrightness();
  }

  @override
  void didPopNext() {
    super.didPushNext();
    ScreenBrightness().resetScreenBrightness();
  }

  @override
  void didPush() {
    super.didPush();
    ScreenBrightness().setScreenBrightness(0.99);
  }

  @override
  void didPushNext() {
    super.didPushNext();
    ScreenBrightness().resetScreenBrightness();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Dialog.fullscreen(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Container(
                width: widget.organizationIconSize,
                height: widget.organizationIconSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: widget.imageProvider,
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
                child: widget.title,
              ),
            ],
          ),
        ),
        body: Padding(
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
                      child: widget.title,
                    ),
                    AnimatedDefaultTextStyle(
                      style: theme.labelMedium!,
                      duration: kThemeChangeDuration,
                      child: widget.subtitle,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: WalletQRCode(
                    code: widget.code,
                    size: 300.0,
                  ),
                ),
              ),
            ],
          ),
        ),
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

class WalletCardBody extends StatelessWidget {
  const WalletCardBody({
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
    required this.expanded,
    this.onTap,
  });

  final bool showQRCode;

  final Widget title;
  final Widget subtitle;
  final ImageProvider<Object> imageProvider;
  final String code;
  final GestureTapCallback? onTap;

  final bool expanded;

  static const cardShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(30),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        color: Theme.of(context).colorScheme.surfaceVariant,
        shape: WalletCard.cardShape,
        child: InkWell(
          customBorder: WalletCard.cardShape,
          onTap: onTap,
          child: AnimatedSize(
            alignment: Alignment.topCenter,
            duration: const Duration(milliseconds: 150),
            reverseDuration: Duration.zero,
            child: Column(
              children: [
                WalletCardBody(
                  imageProvider: imageProvider,
                  title: title,
                  subtitle: subtitle,
                  organizationIconSize: 45,
                ),
                if (expanded)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (_) => WalletFullscreen(
                              title: title,
                              subtitle: subtitle,
                              code: code,
                              imageProvider: imageProvider,
                            ),
                          );
                        },
                        child: WalletQRCode(
                          code: code,
                        ),
                      ),
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
