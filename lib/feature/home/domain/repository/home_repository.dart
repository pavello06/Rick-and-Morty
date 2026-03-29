import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/config/error/failure.dart';
import 'package:rick_and_morty/feature/home/domain/entity/character_page.dart';

abstract interface class HomeRepository {
  Future<Either<Failure, CharacterPage>> getCharacterPage([String? nextPage]);

  Future<Either<Failure, List<int>>> getFavoriteCharacterIdList();
}
