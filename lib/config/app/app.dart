import 'package:flutter/material.dart';
import 'package:rick_and_morty/config/constant/app_constant.dart';
import 'package:rick_and_morty/config/l10n/app_locale.dart';
import 'package:rick_and_morty/config/router/app_router.dart';
import 'package:rick_and_morty/config/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: appName,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      locale: AppLocale.ru,
      localizationsDelegates: AppLocale.localizationsDelegates,
      supportedLocales: AppLocale.supportedLocales,
      debugShowCheckedModeBanner: false,
    );
  }
}
