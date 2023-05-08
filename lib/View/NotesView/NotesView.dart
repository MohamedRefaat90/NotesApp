import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/Models/NoteModel.dart';

import '../AddNote/AddNote.dart';
import 'NoteView_cubit/notes_view_cubit.dart';
import 'Widgets/Note.dart';
import 'Widgets/SearchField.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  static String id = 'NotesView';

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  void initState() {
    BlocProvider.of<NotesViewCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<NoteModel> notesList =
        BlocProvider.of<NotesViewCubit>(context).notes ?? [];

    return BlocProvider(
      create: (context) => NotesViewCubit(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 24),
          child: Column(
            children: [
              const SearchField(),
              const SizedBox(height: 30),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: notesList.length,
                  itemBuilder: (context, index) => Note(note: notesList[index]),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AddNote.id);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
