import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/View/AddNote/AddNote_cubit/add_note_cubit.dart';
import 'package:notes/View/EditNote/Widgets/NoteField.dart';

import '../../Models/NoteModel.dart';
import '../AddNote/Widgets/pickImageFile.dart';
import '../AddNote/Widgets/pickVoiceFile.dart';
import 'Widgets/editButton.dart';

class EditNote extends StatefulWidget {
  const EditNote({Key? key}) : super(key: key);
  static String id = "EditNote";

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  @override
  Widget build(BuildContext context) {
    NoteModel note = ModalRoute.of(context)!.settings.arguments as NoteModel;
    String? title, description;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Note'),
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
                const pickImageFile(),
                const SizedBox(height: 20),
                const pickVoiceFile(),
                const SizedBox(height: 50),
                EditButton(
                  press: () {
                    note.title = title ?? note.title;
                    note.note = description ?? note.note;
                    note.image = BlocProvider.of<AddNoteCubit>(context).imgNote ?? note.image;
                    note.record = BlocProvider.of<AddNoteCubit>(context).voiceNote ?? note.record;
                    note.save();
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          ),
        ));
  }
}