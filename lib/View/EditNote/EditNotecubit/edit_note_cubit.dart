import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes/Models/NoteModel.dart';

import '../../../constants.dart';

part 'edit_note_state.dart';

class EditNoteCubit extends Cubit<EditNoteState> {
  EditNoteCubit() : super(EditNoteInitial());

  String title = '';
  String description = '';
  String? imgNote = '';
  String? voiceNote = '';
  RecorderController controller = RecorderController();

  startRecord() async {
    controller
      ..androidEncoder = AndroidEncoder.aac
      ..androidOutputFormat = AndroidOutputFormat.mpeg4
      ..iosEncoder = IosEncoder.kAudioFormatMPEG4AAC
      ..sampleRate = 16000;
    final hasPermission = await controller.checkPermission();

    if (hasPermission) {
      emit(EditNoteVoiceLoading());
      await controller.record();
    }
  }

  Future<String?> stopRecode() async {
    voiceNote = await controller.stop();
    emit(EditNoteVoiceSuccess());
    return voiceNote;
  }

  editNote(NoteModel note)async{
    try {
      var noteBox = Hive.box<NoteModel>(kNotesBox);

      await noteBox.add(note);

      emit(EditNoteSucess());
    } catch (e) {
      emit(EditNoteFailure(errorMSG: e.toString()));
    }
  }


}
