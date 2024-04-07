// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tasks_view_cubit.dart';

@immutable
abstract class TasksViewState {}

class TasksViewInitial extends TasksViewState {}

class TasksViewSuccess extends TasksViewState {}

class TasksViewLightTheme extends TasksViewState {}

class TasksViewDarkTheme extends TasksViewState {}
