import 'package:cat_trivia/feature/CatFacts/data/local/models/cat_fact_entity_adapter.dart';
import 'package:cat_trivia/feature/CatFacts/domain/entities/cat_fact_entity.dart';
import 'package:hive/hive.dart';

class GetFaveFacts {
  Future<List<CatFactEntity>> call() async {
    final box =  Hive.box<CatFactEntity>('fave');
    final facts = box.values.toList();
    return facts;
  }
}
