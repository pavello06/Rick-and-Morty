import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/config/error/failure.dart';
import 'package:rick_and_morty/shared/domain/entity/character.dart';

abstract interface class SharedRepository {
  Future<Either<Failure, void>> saveCharacter(Character character);

  Future<Either<Failure, void>> deleteCharacter(int id);
}
