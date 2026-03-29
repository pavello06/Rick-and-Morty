import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:rick_and_morty/shared/data/datasource/shared_local_data_source.dart';
import 'package:rick_and_morty/shared/data/model/character_dto.dart';

class SharedLocalDataSourceImpl implements SharedLocalDataSource {
  @override
  Future<void> saveCharacter(CharacterDto character) async {
    await Hive.box<String>(
      'characters',
    ).put(character.id, jsonEncode(character.toJson()));
  }

  @override
  Future<void> deleteCharacter(int id) {
    return Hive.box<String>('characters').delete(id);
  }
}
