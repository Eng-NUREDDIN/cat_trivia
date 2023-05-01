
import 'package:cat_trivia/core/exception/error_model.dart';
import 'package:cat_trivia/core/server/api_service.dart';
import 'package:cat_trivia/core/service_locator/service_locator.dart';

import 'package:cat_trivia/feature/cat_facts/data/remote/models/cat_fact_model.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';





class CatFactDataSource {
  Future<CatFactModel> getCatFact() async {
    try {
      final response =
          await ServiceLocator.getIt.get<ApiService>().getCatFact("cat", 1);
      final fact = CatFactModel.fromJson(response.data);





      final box = Hive.box<CatFactModel>('cat');

      await box.add(fact);

      return fact;
    } on DioError catch (e) {
      throw ErrorModel(
          errorMessage: e.message as String, errorCode: 400, success: false);
    }
  }
}
