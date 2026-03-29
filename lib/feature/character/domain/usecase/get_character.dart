import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/config/error/failure.dart';
import 'package:rick_and_morty/feature/character/domain/repository/character_repository.dart';
import 'package:rick_and_morty/shared/domain/entity/character.dart';

class GetCharacter {
  GetCharacter(this._repository);

  final CharacterRepository _repository;

  Future<Either<Failure, Character>> call(int id) {
    return _repository.getCharacter(id);
  }
}
