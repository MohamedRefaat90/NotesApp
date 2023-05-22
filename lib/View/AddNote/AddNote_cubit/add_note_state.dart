// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_note_cubit.dart';

@immutable
abstract class AddNoteState {}

class AddNoteInitial extends AddNoteState {}

class AddNoteLoading extends AddNoteState {}

class AddNoteSuccess extends AddNoteState {}

class AddNoteFailure extends AddNoteState {
  final String errorMSG;
  AddNoteFailure({
    required this.errorMSG,
  });
}

class AddNoteImageSuccess extends AddNoteState {}

class AddNoteImageFailure extends AddNoteState {
  final String errorMSG;
  AddNoteImageFailure({
    required this.errorMSG,
  });
}

class AddNoteVoiceLoading extends AddNoteState {}

class AddNoteVoiceSuccess extends AddNoteState {}

class AddNoteVoiceFailure extends AddNoteState {
  final String errorMSG;
  AddNoteVoiceFailure({
    required this.errorMSG,
  });
}

class AddNoteDocumentSuccess extends AddNoteState {}

class AddNoteDocumentFailure extends AddNoteState {}
