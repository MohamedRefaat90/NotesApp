import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_routing.dart';
import '../../data/models/task_model.dart';
import '../Widgets/tasks_view/appbar.dart';
import '../Widgets/tasks_view/drawer.dart';
import '../Widgets/tasks_view/tasks_list.dart';
import '../cubit/task_view/tasks_view_cubit.dart';

class TasksView extends StatelessWidget {
  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    TaskViewCubit cubit = BlocProvider.of<TaskViewCubit>(context);
    return BlocBuilder<TaskViewCubit, TasksViewState>(
      builder: (context, state) {
        Brightness themeMode = cubit.themeMode;
        List<TaskModel> Tasks = cubit.Tasks ?? [];

        return Scaffold(
          appBar: appBar(themeMode, context),
          floatingActionButton: FloatingActionButton(
            onPressed: () => context.pushNamed(AppRouter.addTask),
            child: const Icon(Icons.add),
          ),
          drawer: CustomDrawer(),
          body: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Tasks.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        '🤷🏻‍♂️',
                        style: TextStyle(fontSize: 80),
                      ),
                      Text(AppLocalizations.of(context)!.tasks_empty,
                          style: const TextStyle(fontSize: 20)),
                    ],
                  )
                : Column(
                    children: [
                      const SizedBox(height: 10),
                      TasksList(tasks: Tasks)
                    ],
                  ),
          )),
        );
      },
    );
  }
}
