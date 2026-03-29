import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/config/error/failure.dart';
import 'package:rick_and_morty/feature/favorite/domain/repository/favorite_repository.dart';
import 'package:rick_and_morty/shared/domain/entity/character.dart';

class GetFavoriteCharacterList {
  GetFavoriteCharacterList(this._repository);

  final FavoriteRepository _repository;

  Future<Either<Failure, List<Character>>> call() {
    return _repository.getFavoriteCharacterList();
  }
}
