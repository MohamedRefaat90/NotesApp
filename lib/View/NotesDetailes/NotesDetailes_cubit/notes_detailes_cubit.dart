import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';

part 'notes_detailes_state.dart';

class NotesDetailesCubit extends Cubit<NotesDetailesState> {
  NotesDetailesCubit() : super(NotesDetailesInitial());
}
