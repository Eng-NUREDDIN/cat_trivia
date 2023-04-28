

import 'package:cat_trivia/feature/cat_facts/data/remote/models/cat_fact_model.dart';
import 'package:hive/hive.dart';

class GetFactHistory {
  Future<List<CatFactModel>> call() async {
    final box =  Hive.box<CatFactModel>('cat');

    final facts = box.values.toList();
    return facts;
  }
}
