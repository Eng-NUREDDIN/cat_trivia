import 'package:cat_trivia/feature/CatFacts/data/remote/models/cat_fact_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class CatFactModelAdapter extends TypeAdapter<CatFactModel> {
  @override
  final int typeId = 0;

  @override
  CatFactModel read(BinaryReader reader) {

    //final fields = reader.readByte();
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    return CatFactModel.fromJson(fields as Map<String, dynamic>);
  }

  @override
  void write(BinaryWriter writer, CatFactModel obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.user);
    writer.writeString(obj.text);
    writer.writeString(obj.type);
    writer.writeBool(obj.deleted);
    writer.writeString(obj.createdAt);
    writer.writeString(obj.updatedAt);
  }
}
