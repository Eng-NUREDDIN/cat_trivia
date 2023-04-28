
import 'package:cat_trivia/feature/cat_facts/domain/entities/cat_fact_entity.dart';
import 'package:hive/hive.dart';


class CatFactEntityAdapter extends TypeAdapter<CatFactEntity> {
  @override
  final int typeId = 1;

  @override
  CatFactEntity read(BinaryReader reader) {
    final id = reader.read();
    final user = reader.read();
    final text = reader.read();
    final type = reader.read();
    final deleted = reader.read();
    final createdAt = reader.read();
    final updatedAt = reader.read();
    return CatFactEntity(id, user, text, type, deleted, createdAt, updatedAt);
  }

  @override
  void write(BinaryWriter writer, CatFactEntity obj) {
    writer.write(obj.id);
    writer.write(obj.user);
    writer.write(obj.text);
    writer.write(obj.type);
    writer.write(obj.deleted);
    writer.write(obj.createdAt);
    writer.write(obj.updatedAt);
  }
}
