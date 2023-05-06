import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/View/AddNote/AddNote_cubit/add_note_cubit.dart';

import 'Widgets/NoteDescription.dart';
import 'Widgets/NoteTitle.dart';
import 'Widgets/pickImageFile.dart';
import 'Widgets/addButton.dart';
import 'Widgets/pickVoiceFile.dart';

class AddNote extends StatelessWidget {
  dynamic selected;
  static String id = 'AddNote';

  AddNote({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Note'),
      ),
      body: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const NoteTitle(),
                  const SizedBox(height: 20),
                  const NoteDescription(),
                  const SizedBox(height: 20),
                  pickImageFile(),
                  const SizedBox(height: 20),
                  pickVoiceFile(),
                  const SizedBox(height: 50),
                  const AddButton()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
