import 'package:cat_trivia/core/exception/server_exception.dart';
import 'package:dartz/dartz.dart';

abstract class BaseUseCases<T> {
  Future<Either<ServerException, T>> call();
}
