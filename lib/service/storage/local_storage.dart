import 'package:hive_flutter/hive_flutter.dart';

abstract class Local {
  static Future<void> init() async {
    await Hive.initFlutter();

    await Hive.openBox<String>('characters');
  }
}
