import 'package:flutter/material.dart';
import 'package:rick_and_morty/config/constant/app_constant.dart';
import 'package:rick_and_morty/config/l10n/s.dart';
import 'package:rick_and_morty/config/router/app_router.dart';
import 'package:rick_and_morty/config/theme/t.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: appName,
      theme: T.light,
      darkTheme: T.dark,
      themeMode: ThemeMode.system,
      locale: S.ru,
      localizationsDelegates: S.localizationsDelegates,
      supportedLocales: S.supportedLocales,
      debugShowCheckedModeBanner: false,
    );
  }
}
