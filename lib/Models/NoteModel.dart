// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

// Name of Generated File by Build Runner 
part 'NoteModel.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject{

  @HiveField(0)
  final String  title;
  @HiveField(1)
  final String? note;
  @HiveField(2)
  final String? image;
  @HiveField(3)
  final String? record;

  NoteModel({
    required this.title,
    required this.note,
    required this.image,
    required this.record,
  });
}
