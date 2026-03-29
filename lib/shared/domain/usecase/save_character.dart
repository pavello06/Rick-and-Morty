import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/config/error/failure.dart';
import 'package:rick_and_morty/shared/domain/entity/character.dart';
import 'package:rick_and_morty/shared/domain/repository/shared_repository.dart';

class SaveCharacter {
  SaveCharacter(this._repository);

  final SharedRepository _repository;

  Future<Either<Failure, void>> call(Character character) {
    final savedCharacter = character.copyWith(isFavorite: true);

    return _repository.saveCharacter(savedCharacter);
  }
}
