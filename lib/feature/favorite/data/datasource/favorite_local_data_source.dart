import 'package:rick_and_morty/shared/data/model/character_dto.dart';

abstract interface class FavoriteLocalDataSource {
  Future<List<CharacterDto>> getFavoriteCharacterList();
} 