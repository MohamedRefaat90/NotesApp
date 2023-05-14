import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/Models/NoteModel.dart';
import 'package:notes/View/EditNote/EditNote.dart';

import 'NotesDetailes_cubit/notes_detailes_cubit.dart';
import 'Widgets/ImageNote.dart';
import 'Widgets/VoiceNote.dart';

class NotesDetailes extends StatefulWidget {
  const NotesDetailes({super.key});
  static String id = "NotesDetailes";

  @override
  State<NotesDetailes> createState() => _NotesDetailesState();
}

class _NotesDetailesState extends State<NotesDetailes> {
  @override
  Widget build(BuildContext context) {
    NoteModel note = ModalRoute.of(context)!.settings.arguments as NoteModel;
    return BlocProvider(
      create: (context) => NotesDetailesCubit(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, EditNote.id, arguments: note);
              },
              icon: const Icon(Icons.edit),
              tooltip: "Edit Note",
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  note.title,
                  style: const TextStyle(fontSize: 40),
                ),
                const SizedBox(height: 10),
                Text(note.note ?? ""),
                const SizedBox(height: 30),
                ImageNote(img: note.image),
                const SizedBox(height: 30),
                VoiceNote(noteVoice: note.record)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
