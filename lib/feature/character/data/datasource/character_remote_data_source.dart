import 'package:rick_and_morty/shared/data/model/character_dto.dart';

abstract interface class CharacterRemoteDataSource {
  Future<CharacterDto> getCharacter(int id);
}
