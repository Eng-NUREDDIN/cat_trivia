
import 'package:cat_trivia/feature/cat_facts/domain/entities/cat_fact_entity.dart';
import 'package:hive/hive.dart';

class GetFaveFacts {
  Future<List<CatFactEntity>> call() async {
    final box =  Hive.box<CatFactEntity>('fave');
    final facts = box.values.toList();
    return facts;
  }
}
