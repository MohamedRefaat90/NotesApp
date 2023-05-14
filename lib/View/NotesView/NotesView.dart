import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/Models/NoteModel.dart';

import '../AddNote/AddNote.dart';
import 'NoteView_cubit/notes_view_cubit.dart';
import 'Widgets/NotleList.dart';

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
    return BlocBuilder<NotesViewCubit, NotesViewState>(
      builder: (context, state) {
        List<NoteModel> notesList =
            BlocProvider.of<NotesViewCubit>(context).notes ?? [];

        Brightness themeMode =
            BlocProvider.of<NotesViewCubit>(context).themeMode;

        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Notes',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            elevation: 0,
            actions: [
              IconButton(
                  onPressed: () {
                    BlocProvider.of<NotesViewCubit>(context).changeTheme();
                  },
                  icon: Icon(
                    themeMode == Brightness.dark
                        ? Icons.sunny
                        : Icons.nightlight_sharp,
                    size: 30,
                    color: themeMode == Brightness.dark
                        ? Colors.white
                        : Colors.black87,
                  ))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                // const SearchField(),
                const SizedBox(height: 10),
                NotesList(notesList: notesList)
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddNote.id);
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
