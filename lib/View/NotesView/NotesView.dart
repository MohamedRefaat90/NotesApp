import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/Models/NoteModel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../AddNote/AddNote.dart';
import 'NoteView_cubit/notes_view_cubit.dart';
import 'Widgets/NotleList.dart';
import 'Widgets/appBar.dart';

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
          appBar: appBar(themeMode, context),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: notesList.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          '🤷🏻‍♂️',
                          style: TextStyle(fontSize: 80),
                        ),
                        Text(AppLocalizations.of(context)!.notes_empty,
                            style: const TextStyle(fontSize: 20)),
                      ],
                    )
                  : Column(
                      children: [
                        const SizedBox(height: 10),
                        NotesList(notesList: notesList)
                      ],
                    ),
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
