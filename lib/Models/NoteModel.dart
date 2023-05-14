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

  NoteModel({
    required this.title,
    required this.note,
    required this.image,
    required this.record,
    this.color,
    required this.date,
  });
}
