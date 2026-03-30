import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/config/error/failure.dart';
import 'package:rick_and_morty/config/util/safecall/safe_data_source_call.dart';
import 'package:rick_and_morty/shared/data/datasource/shared_local_data_source.dart';
import 'package:rick_and_morty/shared/data/mapper/character_mapper.dart';
import 'package:rick_and_morty/shared/domain/entity/character.dart';
import 'package:rick_and_morty/shared/domain/repository/shared_repository.dart';

class SharedRepositoryImpl implements SharedRepository {
  SharedRepositoryImpl({required SharedLocalDataSource localDataSource})
    : _localDataSource = localDataSource;

  final SharedLocalDataSource _localDataSource;

  @override
  Future<Either<Failure, void>> saveCharacter(Character character) {
    return safeLocalDataSourceCall(() async {
      final characterDto = CharacterMapper.toDto(character);

      return await _localDataSource.saveCharacter(characterDto);
    });
  }

  @override
  Future<Either<Failure, void>> deleteCharacter(int id) {
    return safeLocalDataSourceCall(() {
      return _localDataSource.deleteCharacter(id);
    });
  }
}
