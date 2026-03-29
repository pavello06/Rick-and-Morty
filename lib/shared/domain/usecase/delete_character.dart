import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/config/error/failure.dart';
import 'package:rick_and_morty/shared/domain/repository/shared_repository.dart';

class DeleteCharacter {
  DeleteCharacter(this._repository);

  final SharedRepository _repository;

  Future<Either<Failure, void>> call(int id) {
    return _repository.deleteCharacter(id);
  }
}
