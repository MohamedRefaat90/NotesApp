// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_task_cubit.dart';

@immutable
abstract class AddTaskState {}

class AddTaskInitial extends AddTaskState {}

class AddTaskLoading extends AddTaskState {}

class AddTaskSuccess extends AddTaskState {}

class AddTaskFailure extends AddTaskState {
  final String errorMSG;
  AddTaskFailure({
    required this.errorMSG,
  });
}

class AddTaskImageSuccess extends AddTaskState {}

class AddTaskImageFailure extends AddTaskState {
  final String errorMSG;
  AddTaskImageFailure({
    required this.errorMSG,
  });
}

class AddTaskVoiceLoading extends AddTaskState {}

class AddTaskVoiceSuccess extends AddTaskState {}

class AddTaskVoiceFailure extends AddTaskState {
  final String errorMSG;
  AddTaskVoiceFailure({
    required this.errorMSG,
  });
}

class AddTaskDocumentSuccess extends AddTaskState {}

class AddTaskDocumentFailure extends AddTaskState {}
