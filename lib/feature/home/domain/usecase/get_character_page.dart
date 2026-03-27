import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/config/error/failure.dart';
import 'package:rick_and_morty/feature/home/domain/entity/character_page.dart';
import 'package:rick_and_morty/feature/home/domain/repository/home_repository.dart';

class GetCharacterPage {
  GetCharacterPage(this._repository);

  final HomeRepository _repository;

  Future<Either<Failure, CharacterPage>> call() {
    return _repository.getCharacterPage();
  }
}
