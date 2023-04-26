import 'package:flutter/material.dart';

const opengateBlue = Color(0x002e4b73);

final ThemeData theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: opengateBlue,
  ),
);

final ThemeData themeDark = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: opengateBlue,
    brightness: Brightness.dark,
  ),
);
