import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/config/error/failure.dart';
import 'package:rick_and_morty/shared/domain/entity/character.dart';

abstract interface class FavoriteRepository {
  Future<Either<Failure, List<Character>>> getFavoriteCharacterList();
}
