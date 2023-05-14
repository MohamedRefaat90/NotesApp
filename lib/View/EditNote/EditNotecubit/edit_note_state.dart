// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'edit_note_cubit.dart';

@immutable
abstract class EditNoteState {}

class EditNoteInitial extends EditNoteState {}

class EditNoteSucess extends EditNoteState {}
class EditNoteVoiceLoading extends EditNoteState {}
class EditNoteVoiceSuccess extends EditNoteState {}
class EditNoteImageSuccess extends EditNoteState {}

class EditNoteFailure extends EditNoteState {
  String errorMSG;
  EditNoteFailure({
    required this.errorMSG,
  });
}
