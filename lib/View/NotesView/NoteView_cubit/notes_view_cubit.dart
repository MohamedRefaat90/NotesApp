import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../Models/NoteModel.dart';
import '../../../constants.dart';

part 'notes_view_state.dart';

class NotesViewCubit extends Cubit<NotesViewState> {
  NotesViewCubit() : super(NotesViewInitial());

  List<NoteModel>? notes;
  Brightness themeMode = Brightness.dark;
  fetchAllNotes() {
    var noteBox = Hive.box<NoteModel>(kNotesBox);

    notes = noteBox.values.toList();
    emit(NotesViewSuccess());
  }

  changeTheme() {
    if (themeMode == Brightness.dark) {
      themeMode = Brightness.light;
      emit(NotesViewLightTheme());
    } else if (themeMode == Brightness.light) {
      themeMode = Brightness.dark;
      emit(NotesViewDarkTheme());
    }
  }
}
