import 'package:flutter/material.dart';

abstract class AppPalette {
  AppPalette();

  Brightness brightness();

  Color primary();

  Color secondary();

  Color tertiary();
}

class AppPaletteLight extends AppPalette {
  @override
  Brightness brightness() => Brightness.light;

  @override
  Color primary() => Colors.white;

  @override
  Color secondary() => const Color(0xFF121212);

  @override
  Color tertiary() => const Color(0xFF1E1E1E);
}

class AppPaletteDark extends AppPalette {
  @override
  Brightness brightness() => Brightness.dark;

  @override
  Color primary() => const Color(0xFF121212);

  @override
  Color secondary() => Colors.white;

  @override
  Color tertiary() => const Color(0xFF1E1E1E);
}
