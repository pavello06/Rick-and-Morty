import 'package:flutter/material.dart';
import 'package:rick_and_morty/config/app/app.dart';
import 'package:rick_and_morty/service/di/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DI.init();

  runApp(const App());
}
