import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/config/error/failure.dart';
import 'package:rick_and_morty/shared/domain/entity/character.dart';

abstract interface class CharacterRepository {
  Future<Either<Failure, Character>> getCharacter(int id);
}
