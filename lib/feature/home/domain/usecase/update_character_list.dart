import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/config/error/failure.dart';
import 'package:rick_and_morty/feature/home/domain/repository/home_repository.dart';
import 'package:rick_and_morty/shared/domain/entity/character.dart';

class UpdateCharacterList {
  UpdateCharacterList(this._repository);

  final HomeRepository _repository;

  Future<Either<Failure, List<Character>>> call(
    List<Character> characters,
  ) async {
    final favoriteCharacterIdsOrFailure = await _repository
        .getFavoriteCharacterIdList();

    return favoriteCharacterIdsOrFailure.fold((failure) => Left(failure), (
      favoriteCharacterIds,
    ) {
      final updatedCharacters = characters.map((character) {
        final isFavorite = favoriteCharacterIds.contains(character.id);
        return character.copyWith(isFavorite: isFavorite);
      }).toList();

      return Right(updatedCharacters);
    });
  }
}
