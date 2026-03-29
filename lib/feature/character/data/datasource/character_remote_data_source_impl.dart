import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rick_and_morty/config/constant/app_constant.dart';
import 'package:rick_and_morty/config/error/exception.dart';
import 'package:rick_and_morty/feature/character/data/datasource/character_remote_data_source.dart';
import 'package:rick_and_morty/shared/data/model/character_dto.dart';

class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource {
  @override
  Future<CharacterDto> getCharacter(int id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/character/$id'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw ServerException();
    }

    return CharacterDto.fromJson(jsonDecode(response.body));
  }
}
