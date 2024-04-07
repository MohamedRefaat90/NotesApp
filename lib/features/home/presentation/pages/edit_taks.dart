import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/features/home/presentation/Widgets/edit_task/note_field.dart';
import 'package:notes/features/home/presentation/cubit/add_task/add_task_cubit.dart';

import '../../../../core/helpers/constants.dart';
import '../../data/models/task_model.dart';
import '../Widgets/add_task/pickDocument.dart';
import '../Widgets/add_task/task_color_pallate.dart';
import '../Widgets/edit_task/edit_button.dart';
import '../Widgets/edit_task/edit_image_file.dart';
import '../Widgets/edit_task/edit_voice_file.dart';
import '../cubit/task_view/tasks_view_cubit.dart';

class EditNote extends StatefulWidget {
  const EditNote({Key? key}) : super(key: key);

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  @override
  Widget build(BuildContext context) {
    TaskModel note = GoRouterState.of(context).extra! as TaskModel;
    AddTaskCubit addTeskCubit = BlocProvider.of<AddTaskCubit>(context);
    String? title, description;
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.edit_task),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NoteFiled(
                  title: note.title,
                  onChanged: (value) {
                    title = value!;
                  },
                ),
                const SizedBox(height: 20),
                NoteFiled(
                  title: note.note ?? '',
                  minLine: 3,
                  maxLine: 5,
                  onChanged: (value) {
                    description = value!;
                  },
                ),
                const SizedBox(height: 20),
                EditImageFile(task: note),
                const SizedBox(height: 20),
                EditVoiceFile(task: note),
                const SizedBox(height: 20),
                pickDocument(),
                const SizedBox(height: 20),
                const ColorPallate(),
                const SizedBox(height: 20),
                EditButton(
                  press: () {
                    note.title = title ?? note.title;
                    note.note = description ?? note.note;
                    note.image = addTeskCubit.imgTask == ''
                        ? note.image
                        : addTeskCubit.imgTask;
                    note.record = addTeskCubit.voiceTask == ''
                        ? note.record
                        : addTeskCubit.voiceTask;
                    note.color = kTaskColors[addTeskCubit.selectedColor];
                    note.docs = addTeskCubit.docs.isEmpty
                        ? note.docs
                        : addTeskCubit.docs;
                    note.save();
                    BlocProvider.of<TaskViewCubit>(context).fetchAllTasks();
                    addTeskCubit.resetPickers();
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          ),
        ));
  }
}
