// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_fact_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CatFactModelAdapter extends TypeAdapter<CatFactModel> {
  @override
  final int typeId = 0;

  @override
  CatFactModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CatFactModel(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as bool,
      fields[4] as String,
      fields[5] as String,
      fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CatFactModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(6)
      ..write(obj.id)
      ..writeByte(0)
      ..write(obj.user)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.deleted)
      ..writeByte(4)
      ..write(obj.createdAt)
      ..writeByte(5)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatFactModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatFactModel _$CatFactModelFromJson(Map<String, dynamic> json) => CatFactModel(
      json['user'] as String,
      json['text'] as String,
      json['type'] as String,
      json['deleted'] as bool,
      json['createdAt'] as String,
      json['updatedAt'] as String,
      json['_id'] as String,
    );

Map<String, dynamic> _$CatFactModelToJson(CatFactModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user': instance.user,
      'text': instance.text,
      'type': instance.type,
      'deleted': instance.deleted,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
