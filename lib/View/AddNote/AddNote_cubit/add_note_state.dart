part of 'add_note_cubit.dart';

@immutable
abstract class AddNoteState {}

class AddNoteInitial extends AddNoteState {}
class AddNoteLoading extends AddNoteState {}
class AddNoteSuccess extends AddNoteState {}
class AddNoteFailure extends AddNoteState {}  
class AddNoteImageSuccess extends AddNoteState {}  
class AddNoteImageFailure extends AddNoteState {}  
class AddNoteVoiceLoading extends AddNoteState {}  
class AddNoteVoiceSuccess extends AddNoteState {}  
class AddNoteVoiceFailure extends AddNoteState {}  
