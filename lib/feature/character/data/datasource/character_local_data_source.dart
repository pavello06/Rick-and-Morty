import 'package:rick_and_morty/shared/data/model/character_dto.dart';

abstract interface class CharacterLocalDataSource {
  Future<CharacterDto> getCharacter(int id);
}
