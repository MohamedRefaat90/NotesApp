import 'package:flutter/material.dart';
import 'package:notes/features/home/presentation/Widgets/tasks_view/task.dart';

import '../../../data/models/task_model.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
    required this.tasks,
  });

  final List<TaskModel> tasks;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
        itemCount: tasks.length,
        itemBuilder: (context, index) => Note(note: tasks[index]),
      ),
    );
  }
}
