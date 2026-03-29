import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/config/error/exception.dart';
import 'package:rick_and_morty/config/error/failure.dart';

Future<Either<Failure, T>> safeRemoteDataSourceCall<T>(Future<T> Function() call) async {
  try {
    final response = await call();
    return Right(response);
  } on ServerException {
    return Left(ServerFailure());
  } on Exception {
    return Left(UnknownFailure());
  }
}

Future<Either<Failure, T>> safeLocalDataSourceCall<T>(Future<T> Function() call) async {
  try {
    final response = await call();
    return Right(response);
  } on CacheException {
    return Left(CacheFailure());
  } 
  on Exception {
    return Left(UnknownFailure());
  }
}
