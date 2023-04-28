
import 'package:cat_trivia/feature/cat_facts/domain/entities/cat_fact_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'cat_fact_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class CatFactModel extends CatFactEntity {
  @override
  @JsonKey(name: '_id')
  @HiveField(6)
  final String id;
  @HiveField(0)
  final String user;
  @HiveField(1)
  final String text;
  @HiveField(2)
  final String type;
  @HiveField(3)
  final bool deleted;
  @HiveField(4)
  final String createdAt;
  @HiveField(5)
  final String updatedAt;

  const CatFactModel(
    this.user,
    this.text,
    this.type,
    this.deleted,
    this.createdAt,
    this.updatedAt, this.id,
  ) : super(id, user, text, type, deleted, createdAt, updatedAt);

  factory CatFactModel.fromJson(Map<String, dynamic> json) =>
      _$CatFactModelFromJson(json);
}
