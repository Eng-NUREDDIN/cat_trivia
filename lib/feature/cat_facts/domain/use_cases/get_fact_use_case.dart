
import 'package:cat_trivia/core/app_base_use_cases/base_use_cases.dart';
import 'package:cat_trivia/core/exception/server_exception.dart';
import 'package:cat_trivia/feature/cat_facts/domain/entities/cat_fact_entity.dart';
import 'package:cat_trivia/feature/cat_facts/domain/repositories/cat_fact_domain_repository.dart';

import 'package:dartz/dartz.dart';

class GetFactUseCase extends BaseUseCases<CatFactEntity> {
  final CatFactDomainRepository repository;

  GetFactUseCase(this.repository);

  @override
  Future<Either<ServerException, CatFactEntity>> call() async {
    return await repository.getCatFact();
  }
}
