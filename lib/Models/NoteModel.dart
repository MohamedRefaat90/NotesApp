// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:hive/hive.dart';

// Name of Generated File by Build Runner
part 'NoteModel.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String? note;
  @HiveField(2)
  String? image;
  @HiveField(3)
  String? record;
  @HiveField(4)
  int? color;
  @HiveField(5)
  String date;
  @HiveField(6)
  List<String>? docs;

  NoteModel({
    required this.title,
    this.note,
    this.image,
    this.record,
    this.color,
    required this.date,
    this.docs,
  });
}
