part of 'notes_detailes_cubit.dart';

@immutable
abstract class NotesDetailesState {}

class NotesDetailesInitial extends NotesDetailesState {}

class NotesDetailesLoading extends NotesDetailesState {}

class NotesDetailesSuccess extends NotesDetailesState {}

class NotesDetailesFailure extends NotesDetailesState {}
