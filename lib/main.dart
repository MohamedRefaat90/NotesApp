import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/core/di/di.dart';
import 'package:notes/core/helpers/blocObserver.dart';
import 'package:notes/core/theming/app_theme.dart';
import 'package:notes/features/home/data/models/task_model.dart';

import 'core/helpers/constants.dart';
import 'core/routing/app_routing.dart';
import 'features/home/presentation/cubit/add_task/add_task_cubit.dart';
import 'features/home/presentation/cubit/task_view/tasks_view_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = myBlocObserver();
  await Hive.initFlutter();
  initGetIt();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>(kTasksBox);

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TaskViewCubit()..fetchAllTasks()),
        BlocProvider(create: (context) => AddTaskCubit()),
      ],
      child: BlocBuilder<TaskViewCubit, TasksViewState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.mainTheme(context),
            routerConfig: AppRouter.router,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
          );
        },
      ),
    );
  }
}
