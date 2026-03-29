import 'package:hive_flutter/adapters.dart';
import 'package:rick_and_morty/feature/home/data/datasource/home_local_data_source.dart';

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  Future<List<int>> getFavoriteCharacterIdList() async {
    final result = Hive.box<String>('characters').keys;

    return result.map((e) => e as int).toList();
  }
}
