import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rick_and_morty/config/constant/app_constant.dart';
import 'package:rick_and_morty/config/error/exception.dart';
import 'package:rick_and_morty/feature/home/data/datasource/home_remote_data_source.dart';
import 'package:rick_and_morty/feature/home/data/model/character_page_dto.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  HomeRemoteDataSourceImpl();

  @override
  Future<CharacterPageDto> getCharacterPage() async {
    final response = await http.get(
      Uri.parse('$baseUrl/character'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw ServerException();
    }

    return CharacterPageDto.fromJson(jsonDecode(response.body));
  }
}
