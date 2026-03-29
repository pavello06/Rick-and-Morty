import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/config/error/failure.dart';
import 'package:rick_and_morty/config/util/safecall/safe_data_source_call.dart';
import 'package:rick_and_morty/feature/favorite/data/datasource/favorite_local_data_source.dart';
import 'package:rick_and_morty/feature/favorite/domain/repository/favorite_repository.dart';
import 'package:rick_and_morty/shared/data/mapper/character_mapper.dart';
import 'package:rick_and_morty/shared/domain/entity/character.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  FavoriteRepositoryImpl({required this._localDataSource});

  final FavoriteLocalDataSource _localDataSource;

  @override
  Future<Either<Failure, List<Character>>> getFavoriteCharacterList() {
    return safeLocalDataSourceCall(() async {
      final characterDtos = await _localDataSource.getFavoriteCharacterList();

      final characters = characterDtos.map(CharacterMapper.fromDto).toList();

      return characters;
    });
  }
}
