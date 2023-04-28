import 'package:cat_trivia/core/exception/server_exception.dart';
import 'package:cat_trivia/feature/cat_facts/domain/entities/cat_fact_entity.dart';

import 'package:dartz/dartz.dart';

abstract class CatFactDomainRepository {
  Future<Either<ServerException, CatFactEntity>> getCatFact();
}
