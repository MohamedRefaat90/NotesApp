// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'edit_task_cubit.dart';

@immutable
abstract class EditTaskState {}

class EditTaskInitial extends EditTaskState {}

class EditTaskSucess extends EditTaskState {}

class EditTaskVoiceLoading extends EditTaskState {}

class EditTaskVoiceSuccess extends EditTaskState {}

class EditTaskImageSuccess extends EditTaskState {}

class EditTaskFailure extends EditTaskState {
  String errorMSG;
  EditTaskFailure({
    required this.errorMSG,
  });
}
