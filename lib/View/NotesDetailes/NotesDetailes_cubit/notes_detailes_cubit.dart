import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'notes_detailes_state.dart';

class NotesDetailesCubit extends Cubit<NotesDetailesState> {
  NotesDetailesCubit() : super(NotesDetailesInitial());
}
