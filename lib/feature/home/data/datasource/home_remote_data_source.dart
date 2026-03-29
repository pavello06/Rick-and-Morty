import 'package:rick_and_morty/feature/home/data/model/character_page_dto.dart';

abstract interface class HomeRemoteDataSource {
  Future<CharacterPageDto> getCharacterPage([String? nextPage]);
}
