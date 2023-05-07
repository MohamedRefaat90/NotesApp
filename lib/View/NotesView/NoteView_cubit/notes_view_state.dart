// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'notes_view_cubit.dart';

@immutable
abstract class NotesViewState {}

class NotesViewInitial extends NotesViewState {}
class NotesViewLoading extends NotesViewState {}
class NotesViewSuccess extends NotesViewState {}
class NotesViewFailure extends NotesViewState {
  final String errorMSG;
  NotesViewFailure({
    required this.errorMSG,
  });
}
