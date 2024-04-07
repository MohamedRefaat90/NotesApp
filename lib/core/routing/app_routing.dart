import 'package:go_router/go_router.dart';
import 'package:notes/features/login/presentation/pages/login_screen.dart';

import '../../features/home/presentation/pages/add_task.dart';
import '../../features/home/presentation/pages/edit_taks.dart';
import '../../features/home/presentation/pages/task_detailes.dart';
import '../../features/home/presentation/pages/task_view.dart';
import '../../features/users_paginations/presentation/pages/users_screen.dart';

class AppRouter {
  static const String login = "/login";
  static const String viewTasks = "/viewTasks";
  static const String addTask = "/addNote";
  static const String editTask = "/editNote";
  static const String taskDetailes = "/notesDetailes";
  static const String usersScreen = "/usersScreen";

  static final router = GoRouter(
    routes: [
      GoRoute(
          path: login, name: login, builder: (context, state) => LoginScreen()),
      GoRoute(
        // path: viewTasks,
        path: "/",
        name: viewTasks,
        builder: (context, state) => const TasksView(),
      ),
      GoRoute(
        path: addTask,
        name: addTask,
        builder: (context, state) => const AddNote(),
      ),
      GoRoute(
        path: editTask,
        name: editTask,
        builder: (context, state) => const EditNote(),
      ),
      GoRoute(
        path: taskDetailes,
        name: taskDetailes,
        builder: (context, state) => const NotesDetailes(),
      ),
      GoRoute(
        path: usersScreen,
        name: usersScreen,
        builder: (context, state) => const UserScreen(),
      ),
    ],
  );
}
