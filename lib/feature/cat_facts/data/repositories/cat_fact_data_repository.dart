import 'package:cat_trivia/core/exception/server_exception.dart';

import 'package:cat_trivia/feature/cat_facts/data/remote/data_sources/cat_fact_data_source.dart';
import 'package:cat_trivia/feature/cat_facts/domain/entities/cat_fact_entity.dart';
import 'package:cat_trivia/feature/cat_facts/domain/repositories/cat_fact_domain_repository.dart';
import 'package:dartz/dartz.dart';

class CatFactDataRepository implements CatFactDomainRepository {
  final CatFactDataSource catFactDataSource;

  CatFactDataRepository(this.catFactDataSource);

  @override
  Future<Either<ServerException, CatFactEntity>> getCatFact() async {
    try {
      final result = await catFactDataSource.getCatFact();
      return Right(result);
    } on ServerException catch (serverException) {
      return Left(serverException);
    }
  }
}
