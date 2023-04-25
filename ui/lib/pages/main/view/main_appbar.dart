import 'package:flutter/material.dart';

class MainAppbarLogo extends StatelessWidget {
  const MainAppbarLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image(
      width: 180,
      image: AssetImage(
        MediaQuery.of(context).platformBrightness == Brightness.light
            ? 'assets/logos/opengate_logo_light.png'
            : 'assets/logos/opengate_logo_dark.png',
      ),
    );
  }
}
