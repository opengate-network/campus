import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

final brightness = SchedulerBinding.instance.window.platformBrightness;
final isDarkMode = brightness == Brightness.dark;

final ThemeData theme = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme.light(),
);

final ThemeData themeDark = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme.dark(),
);
