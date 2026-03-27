import 'package:flutter/material.dart';
import 'package:rick_and_morty/config/theme/app_theme.dart';

abstract class T {
  static ThemeData get light => AppTheme.light();

  static ThemeData get dark => AppTheme.dark();

  static ThemeData of(BuildContext context) => Theme.of(context);
}
