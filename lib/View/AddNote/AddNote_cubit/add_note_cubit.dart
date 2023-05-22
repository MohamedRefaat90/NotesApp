import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
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
  List<String> docs = [];
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
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['wav', 'aac', 'mp3', 'ogg' 'm4a', 'flac']);

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
    if (kIsWeb) {
      // Image.file(File(pickedFile.path));
    } else {
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
    return null;
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
    docs = [];
  }

  Future<List<String>>? pickDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: [
        'pdf',
        'doc',
        'docx',
        'csv',
        'xls',
        'xlsx',
        'pps',
        'ppt',
        'pptx'
      ],
    );

    if (result != null) {
      docs = result.paths.map((path) => path.toString()).toList();
      emit(AddNoteDocumentSuccess());
      return docs;
    } else {
      emit(AddNoteDocumentFailure());
      return [];
    }
  }

  String imageofDoc(String doc) {
    if (doc.endsWith('.pdf')) {
      return 'assets/images/pdf.png';
    } else if (doc.endsWith('.doc') || doc.endsWith('.docx')) {
      return 'assets/images/microsoft_word.png';
    } else if (doc.endsWith('.csv') ||
        doc.endsWith('.xls') ||
        doc.endsWith('.xlsx')) {
      return 'assets/images/excel.png';
    } else if (doc.endsWith('.pps') ||
        doc.endsWith('.ppt') ||
        doc.endsWith('.pptx')) {
      return 'assets/images/powerpoint.png';
    } else {
      return 'unsupported Format';
    }
  }
}
