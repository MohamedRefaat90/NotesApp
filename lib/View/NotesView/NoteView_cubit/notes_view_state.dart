part of 'notes_view_cubit.dart';

@immutable
abstract class NotesViewState {}

class NotesViewInitial extends NotesViewState {}
class NotesViewLoading extends NotesViewState {}
class NotesViewSuccess extends NotesViewState {}
class NotesViewFailure extends NotesViewState {}
