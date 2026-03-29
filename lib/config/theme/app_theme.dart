import 'package:flutter/material.dart';
import 'package:rick_and_morty/config/theme/app_palette.dart';

abstract class AppTheme {
  static ThemeData _data(AppPalette palette) => ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: palette.primary(),
      brightness: palette.brightness(),
      primary: palette.primary(),
      secondary: palette.secondary(),
      tertiary: palette.tertiary(),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: palette.tertiary(),
      surfaceTintColor: palette.tertiary(),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: palette.secondary(),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: palette.secondary(),
        backgroundColor: palette.tertiary(),
      ),
    )
  );

  static ThemeData light() => _data(AppPaletteLight());

  static ThemeData dark() => _data(AppPaletteDark());
}
