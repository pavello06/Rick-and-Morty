import 'package:rick_and_morty/shared/data/model/character_dto.dart';

abstract interface class SharedLocalDataSource {
  Future<void> saveCharacter(CharacterDto character);

  Future<void> deleteCharacter(int id);
}
