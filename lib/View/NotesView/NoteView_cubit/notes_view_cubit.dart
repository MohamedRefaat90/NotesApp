import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'notes_view_state.dart';

class NotesViewCubit extends Cubit<NotesViewState> {
  NotesViewCubit() : super(NotesViewInitial());
}
