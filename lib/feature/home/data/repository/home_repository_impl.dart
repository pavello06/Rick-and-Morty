import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/config/error/failure.dart';
import 'package:rick_and_morty/config/util/safecall/safe_data_source_call.dart';
import 'package:rick_and_morty/feature/home/data/datasource/home_local_data_source.dart';
import 'package:rick_and_morty/feature/home/data/datasource/home_remote_data_source.dart';
import 'package:rick_and_morty/feature/home/data/mapper/character_page_mapper.dart';
import 'package:rick_and_morty/feature/home/domain/entity/character_page.dart';
import 'package:rick_and_morty/feature/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({
    required this._remoteDataSource,
    required this._localDataSource,
  });

  final HomeRemoteDataSource _remoteDataSource;
  final HomeLocalDataSource _localDataSource;

  @override
  Future<Either<Failure, CharacterPage>> getCharacterPage([String? nextPage]) {
    return safeRemoteDataSourceCall(() async {
      final characterPageDto = await _remoteDataSource.getCharacterPage(
        nextPage,
      );

      final characterPage = CharacterPageMapper.fromDto(characterPageDto);

      return characterPage;
    });
  }

  @override
  Future<Either<Failure, List<int>>> getFavoriteCharacterIdList() {
    return safeLocalDataSourceCall(() {
      return _localDataSource.getFavoriteCharacterIdList();
    });
  }
}
