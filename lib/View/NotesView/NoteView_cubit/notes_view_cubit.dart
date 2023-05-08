import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

import '../../../Models/NoteModel.dart';
import '../../../constants.dart';

part 'notes_view_state.dart';

class NotesViewCubit extends Cubit<NotesViewState> {
  NotesViewCubit() : super(NotesViewInitial());

  List<NoteModel>? notes;
  
  fetchAllNotes() {
    var noteBox = Hive.box<NoteModel>(kNotesBox);

    notes = noteBox.values.toList();
  }
}
