import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notes/core/constants/app_assets.dart';

import '../../../../../core/helpers/constants.dart';
import '../../../data/models/task_model.dart';
import '../../Widgets/add_task/bottom_sheet.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  RecorderController controller = RecorderController();

  dynamic voiceType;

  bool pickImageSuccess = false;
  bool pickVoiceSuccess = false;
  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;
  String title = '';

  String description = '';
  String? imgTask = '';
  String? voiceTask = '';
  List<String> docs = [];
  int selectedColor = 0;

  AddTaskCubit() : super(AddTaskInitial());

  addTask(TaskModel Task) async {
    emit(AddTaskLoading());
    try {
      var TaskBox = Hive.box<TaskModel>(kTasksBox);

      await TaskBox.add(Task);

      emit(AddTaskSuccess());
    } catch (e) {
      emit(AddTaskFailure(errorMSG: e.toString()));
    }
  }

  String imageofDoc(String doc) {
    if (doc.endsWith('.pdf')) {
      return AppAssets.pdf;
    } else if (doc.endsWith('.doc') || doc.endsWith('.docx')) {
      return AppAssets.word;
    } else if (doc.endsWith('.csv') ||
        doc.endsWith('.xls') ||
        doc.endsWith('.xlsx')) {
      return AppAssets.excel;
    } else if (doc.endsWith('.pps') ||
        doc.endsWith('.ppt') ||
        doc.endsWith('.pptx')) {
      return AppAssets.powerpoint;
    } else {
      return 'unsupported Format';
    }
  }

  void openBottomSheet(BuildContext context) {
    bottomSheet(context);
  }

  Future<String?> pickAudioFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['wav', 'aac', 'mp3', 'ogg' 'm4a', 'flac']);

    try {
      emit(AddTaskVoiceLoading());

      File file = File(result!.files.single.path!);
      pickVoiceSuccess = true;
      voiceTask = file.path;
      emit(AddTaskVoiceSuccess());

      return voiceTask;
    } catch (e) {
      emit(AddTaskVoiceFailure(errorMSG: e.toString()));
      return null;
    }
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
      emit(AddTaskDocumentSuccess());
      return docs;
    } else {
      emit(AddTaskDocumentFailure());
      return [];
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
        imgTask = file.path;
        emit(AddTaskImageSuccess());
        return imgTask;
      } else {
        emit(AddTaskImageFailure(errorMSG: "Picked Failed"));
        return "Picked Failed";
      }
    }
    return null;
  }

  resetPickers() {
    imgTask = '';
    voiceTask = '';
    pickImageSuccess = false;
    pickVoiceSuccess = false;
    docs = [];
  }

  startRecord() async {
    controller
      ..androidEncoder = AndroidEncoder.aac
      ..androidOutputFormat = AndroidOutputFormat.mpeg4
      ..iosEncoder = IosEncoder.kAudioFormatMPEG4AAC
      ..sampleRate = 16000;
    final hasPermission = await controller.checkPermission();

    if (hasPermission) {
      emit(AddTaskVoiceLoading());
      await controller.record();
    }
  }

  Future<String?> stopRecode() async {
    voiceTask = await controller.stop();
    emit(AddTaskVoiceSuccess());
    return voiceTask;
  }
}
