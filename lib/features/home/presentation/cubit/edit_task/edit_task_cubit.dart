import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

import '../../../../../core/helpers/constants.dart';
import '../../../data/models/task_model.dart';

part 'edit_task_state.dart';

class EditTaskCubit extends Cubit<EditTaskState> {
  EditTaskCubit() : super(EditTaskInitial());

  String title = '';
  String description = '';
  String? imgTask = '';
  String? voiceTask = '';
  RecorderController controller = RecorderController();

  startRecord() async {
    controller
      ..androidEncoder = AndroidEncoder.aac
      ..androidOutputFormat = AndroidOutputFormat.mpeg4
      ..iosEncoder = IosEncoder.kAudioFormatMPEG4AAC
      ..sampleRate = 16000;
    final hasPermission = await controller.checkPermission();

    if (hasPermission) {
      emit(EditTaskVoiceLoading());
      await controller.record();
    }
  }

  Future<String?> stopRecode() async {
    voiceTask = await controller.stop();
    emit(EditTaskVoiceSuccess());
    return voiceTask;
  }

  editTask(TaskModel Task) async {
    try {
      var TaskBox = Hive.box<TaskModel>(kTasksBox);

      await TaskBox.add(Task);

      emit(EditTaskSucess());
    } catch (e) {
      emit(EditTaskFailure(errorMSG: e.toString()));
    }
  }
}
