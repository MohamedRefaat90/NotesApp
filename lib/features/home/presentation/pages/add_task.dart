import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:notes/core/helpers/constants.dart';
import 'package:notes/features/home/data/models/task_model.dart';
import 'package:notes/features/home/presentation/cubit/add_task/add_task_cubit.dart';

import '../Widgets/add_task/add_button.dart';
import '../Widgets/add_task/note_form.dart';
import '../Widgets/add_task/pickDocument.dart';
import '../Widgets/add_task/pickImageFile.dart';
import '../Widgets/add_task/pick_voice_file.dart';
import '../Widgets/add_task/task_color_pallate.dart';
import '../cubit/task_view/tasks_view_cubit.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.add_task_title),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NoteForm(formkey: formkey),
                const SizedBox(height: 20),
                const pickImageFile(),
                const SizedBox(height: 20),
                const pickVoiceFile(),
                const SizedBox(height: 20),
                pickDocument(),
                const SizedBox(height: 20),
                const ColorPallate(),
                const SizedBox(height: 20),
                AddTaskButton(
                  press: () {
                    AddTaskCubit cubit = BlocProvider.of<AddTaskCubit>(context);
                    if (formkey.currentState!.validate()) {
                      formkey.currentState!.save();

                      TaskModel task = TaskModel(
                          title: cubit.title,
                          note: cubit.description,
                          image: cubit.imgTask,
                          record: cubit.voiceTask,
                          date: DateFormat.yMd().format(DateTime.now()),
                          color: kTaskColors[cubit.selectedColor],
                          docs: cubit.docs);

                      cubit.addTask(task);
                      BlocProvider.of<TaskViewCubit>(context).fetchAllTasks();
                      Navigator.of(context).pop();
                      cubit.resetPickers();
                    } else {
                      cubit.autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                )
              ],
            ),
          ),
        ));
  }
}
