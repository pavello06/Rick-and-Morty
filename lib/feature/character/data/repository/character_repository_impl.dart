import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/config/error/failure.dart';
import 'package:rick_and_morty/config/util/safecall/safe_data_source_call.dart';
import 'package:rick_and_morty/feature/character/data/datasource/character_local_data_source.dart';
import 'package:rick_and_morty/feature/character/data/datasource/character_remote_data_source.dart';
import 'package:rick_and_morty/feature/character/domain/repository/character_repository.dart';
import 'package:rick_and_morty/shared/data/mapper/character_mapper.dart';
import 'package:rick_and_morty/shared/domain/entity/character.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  CharacterRepositoryImpl({
    required this._remoteDataSource,
    required this._localDataSource,
  });

  final CharacterRemoteDataSource _remoteDataSource;
  final CharacterLocalDataSource _localDataSource;

  @override
  Future<Either<Failure, Character>> getCharacter(int id) async {
    final characterOrFailure = await safeRemoteDataSourceCall(() async {
      final characterDto = await _remoteDataSource.getCharacter(id);

      final character = CharacterMapper.fromDto(characterDto);

      return character;
    });

    if (characterOrFailure.isRight()) {
      return characterOrFailure;
    }

    return safeLocalDataSourceCall(() async {
      final characterDto = await _localDataSource.getCharacter(id);

      final character = CharacterMapper.fromDto(characterDto);

      return character;
    });
  }
}
