import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:rick_and_morty/feature/favorite/data/datasource/favorite_local_data_source.dart';
import 'package:rick_and_morty/shared/data/model/character_dto.dart';

class FavoriteLocalDataSourceImpl implements FavoriteLocalDataSource {
  FavoriteLocalDataSourceImpl();

  @override
  Future<List<CharacterDto>> getFavoriteCharacterList() async {
    final result = Hive.box<String>('characters').values.toList();

    return result.map((e) => CharacterDto.fromJson(jsonDecode(e))).toList();
  }
}
