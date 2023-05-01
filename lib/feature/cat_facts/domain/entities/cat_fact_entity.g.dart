// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_fact_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CatFactEntityAdapter extends TypeAdapter<CatFactEntity> {
  @override
  final int typeId = 1;

  @override
  CatFactEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CatFactEntity(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as bool,
      fields[5] as String,
      fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CatFactEntity obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.user)
      ..writeByte(2)
      ..write(obj.text)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.deleted)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(6)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatFactEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatFactEntity _$CatFactEntityFromJson(Map<String, dynamic> json) =>
    CatFactEntity(
      json['id'] as String,
      json['user'] as String,
      json['text'] as String,
      json['type'] as String,
      json['deleted'] as bool,
      json['createdAt'] as String,
      json['updatedAt'] as String,
    );

Map<String, dynamic> _$CatFactEntityToJson(CatFactEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'text': instance.text,
      'type': instance.type,
      'deleted': instance.deleted,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
