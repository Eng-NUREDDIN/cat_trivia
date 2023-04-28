import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';



@HiveType(typeId: 1)
class CatFactEntity extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String user;
  @HiveField(2)
  final String text;
  @HiveField(3)
  final String type;
  @HiveField(4)
  final bool deleted;
  @HiveField(5)
  final String createdAt;
  @HiveField(6)
  final String updatedAt;

  const CatFactEntity(this.id, this.user, this.text, this.type, this.deleted,
      this.createdAt, this.updatedAt);

  @override
  List<Object> get props =>
      [id, user, text, type, deleted, createdAt, updatedAt];
}
