import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:notes/Models/NoteModel.dart';
import 'package:notes/constants.dart';
import '../Widgets/bottomSheet.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  RecorderController controller = RecorderController();

  dynamic voiceType;
  bool pickImageSuccess = false;
  bool pickVoiceSuccess = false;
  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;

  String title = '';
  String description = '';
  String? imgNote = '';
  String? voiceNote = '';
  int selectedColor = 0;
  startRecord() async {
    controller
      ..androidEncoder = AndroidEncoder.aac
      ..androidOutputFormat = AndroidOutputFormat.mpeg4
      ..iosEncoder = IosEncoder.kAudioFormatMPEG4AAC
      ..sampleRate = 16000;
    final hasPermission = await controller.checkPermission();

    if (hasPermission) {
      emit(AddNoteVoiceLoading());
      await controller.record();
    }
  }

  Future<String?> stopRecode() async {
    voiceNote = await controller.stop();
    emit(AddNoteVoiceSuccess());
    return voiceNote;
  }

  void openBottomSheet(BuildContext context) {
    // emit(AddNoteVoiceLoading());
    bottomSheet(context);
  }

  Future<String?> pickAudioFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    try {
      emit(AddNoteVoiceLoading());

      File file = File(result!.files.single.path!);
      pickVoiceSuccess = true;
      voiceNote = file.path;
      emit(AddNoteVoiceSuccess());

      return voiceNote;
    } catch (e) {
      emit(AddNoteVoiceFailure(errorMSG: e.toString()));
      return null;
    }
  }

  Future<String?> pickImage(String type) async {
    final ImagePicker picker = ImagePicker();
    late File file;
    final XFile? image = await picker.pickImage(
        source: type == "Gallery" ? ImageSource.gallery : ImageSource.camera);

    if (image != null) {
      file = File(image.path);
      imgNote = file.path;
      emit(AddNoteImageSuccess());
      return imgNote;
    } else {
      emit(AddNoteImageFailure(errorMSG: "Picked Failed"));
      return "Picked Failed";
    }
  }

  addNote(NoteModel note) async {
    emit(AddNoteLoading());
    try {
      var noteBox = Hive.box<NoteModel>(kNotesBox);

      await noteBox.add(note);

      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(errorMSG: e.toString()));
    }
  }

  resetPickers() {
    imgNote = '';
    voiceNote = '';
    pickImageSuccess = false;
    pickVoiceSuccess = false;
  }
}
