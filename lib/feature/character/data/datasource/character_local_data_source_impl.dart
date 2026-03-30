import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:rick_and_morty/config/error/exception.dart';
import 'package:rick_and_morty/feature/character/data/datasource/character_local_data_source.dart';
import 'package:rick_and_morty/shared/data/model/character_dto.dart';

class CharacterLocalDataSourceImpl implements CharacterLocalDataSource {
  @override
  Future<CharacterDto> getCharacter(int id) async {
    final result = Hive.box<String>('characters').get(id);

    if (result == null) {
      throw CacheException();
    }

    return CharacterDto.fromJson(jsonDecode(result));
  }
}
