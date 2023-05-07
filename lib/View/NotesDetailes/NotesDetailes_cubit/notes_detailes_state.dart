// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'notes_detailes_cubit.dart';

@immutable
abstract class NotesDetailesState {}

class NotesDetailesInitial extends NotesDetailesState {}

class NotesDetailesLoading extends NotesDetailesState {}

class NotesDetailesSuccess extends NotesDetailesState {}

class NotesDetailesFailure extends NotesDetailesState {
  final String errorMSG;
  NotesDetailesFailure({
    required this.errorMSG,
  });
}
