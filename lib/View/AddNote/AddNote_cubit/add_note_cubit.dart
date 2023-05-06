import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:file_picker/file_picker.dart';
import '../Widgets/bottomSheet.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  RecorderController controller = RecorderController();

  dynamic voiceType;
  bool pickImageSuccess = false;
  bool pickVoiceSuccess = false;

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
      emit(AddNoteVoiceSuccess());

    }
  }

  stopRecode() async {
    final path = await controller.stop();
    emit(AddNoteVoiceSuccess());
  }

  void openBottomSheet(BuildContext context) {
    // emit(AddNoteVoiceLoading());
    bottomSheet(context);
  }

  pickAudioFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      pickVoiceSuccess = true;
      emit(AddNoteVoiceSuccess());
    } else {

      emit(AddNoteVoiceFailure());
    }
  }

  void pickImage(String type) async {
    final ImagePicker picker = ImagePicker();
    late File file;
    final XFile? image = await picker.pickImage(
        source: type == "Gallery" ? ImageSource.gallery : ImageSource.camera);

    if (image != null) {
      file = File(image.path);
      var imgName = basename(image.path);
emit(AddNoteImageSuccess());
    }else{
emit(AddNoteImageFailure());
    }
  }
}
