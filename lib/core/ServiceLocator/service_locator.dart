import 'package:cat_trivia/core/server/api_service.dart';
import 'package:cat_trivia/feature/CatFacts/data/local/models/cat_fact_entity_adapter.dart';

import 'package:cat_trivia/feature/CatFacts/data/remote/data_sources/cat_fact_data_source.dart';
import 'package:cat_trivia/feature/CatFacts/data/remote/models/cat_fact_model.dart';
import 'package:cat_trivia/feature/CatFacts/data/repositories/cat_fact_data_repository.dart';
import 'package:cat_trivia/feature/CatFacts/domain/entities/cat_fact_entity.dart';
import 'package:cat_trivia/feature/CatFacts/domain/repositories/cat_fact_domain_repository.dart';
import 'package:cat_trivia/feature/CatFacts/domain/use_cases/get_fact_use_case.dart';
import 'package:cat_trivia/feature/CatFacts/presentation/manager/home_page_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ServiceLocator {
  static final getIt = GetIt.instance;
  static  Future<void> initHive() async {

    Hive.registerAdapter(CatFactModelAdapter());
    Hive.registerAdapter(CatFactEntityAdapter());
    await Hive.initFlutter();
    await Hive.openBox<CatFactModel>('cat');
    await Hive.openBox<CatFactEntity>('fave',);

  }

 static Future<void> setup() async {
    // create Dio instance
    getIt.registerSingleton<Dio>(Dio());
    // create ApiService instance
    getIt.registerSingleton<ApiService>(ApiService(getIt<Dio>()));


    // local data source
    // getIt.registerSingleton(() => CatFactModelAdapter());
    // getIt.registerSingleton(() => CatFactEntityAdapter());



//Data Source
    getIt.registerLazySingleton<CatFactDataSource>(() => CatFactDataSource());
//repository
    getIt.registerLazySingleton<CatFactDomainRepository>(
        () => CatFactDataRepository(getIt()));

    //use cases
    getIt.registerLazySingleton(() => GetFactUseCase(getIt()));

    //bloc
    getIt.registerSingleton<HomePageBloc>(HomePageBloc(getIt()));

  }

}
