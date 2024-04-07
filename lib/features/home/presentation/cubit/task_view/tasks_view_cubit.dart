import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../data/models/task_model.dart';
import '../../../../../core/helpers/constants.dart';

part 'tasks_view_state.dart';

class TaskViewCubit extends Cubit<TasksViewState> {
  TaskViewCubit() : super(TasksViewInitial());

  List<TaskModel>? Tasks;
  Brightness themeMode = Brightness.light;
  fetchAllTasks() {
    var TaskBox = Hive.box<TaskModel>(kTasksBox);

    Tasks = TaskBox.values.toList();
    emit(TasksViewSuccess());
  }

  changeTheme() {
    if (themeMode == Brightness.dark) {
      themeMode = Brightness.light;
      emit(TasksViewLightTheme());
    } else if (themeMode == Brightness.light) {
      themeMode = Brightness.dark;
      emit(TasksViewDarkTheme());
    }
  }
}
