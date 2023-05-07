import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/Models/NoteModel.dart';
import 'package:notes/View/AddNote/AddNote_cubit/add_note_cubit.dart';
import 'package:notes/View/NotesDetailes/NotesDetailes.dart';
import 'package:notes/View/NotesDetailes/NotesDetailes_cubit/notes_detailes_cubit.dart';
import 'package:notes/View/NotesView/NoteView_cubit/notes_view_cubit.dart';
import 'package:notes/blocObserver.dart';

import 'View/AddNote/AddNote.dart';
import 'View/NotesView/NotesView.dart';
import 'constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = myBlocObserver();
  await Hive.initFlutter();
  await Hive.openBox(kNotesBox);
  Hive.registerAdapter(NoteModelAdapter());

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NotesViewCubit()),
        BlocProvider(create: (context) => NotesDetailesCubit()),
        BlocProvider(create: (context) => AddNoteCubit()),
      ],
      child: MaterialApp(
        title: 'Botes App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark, useMaterial3: true),
        routes: {
          NotesView.id: (context) => const NotesView(),
          NotesDetailes.id: (context) => const NotesDetailes(),
          AddNote.id: (context) => AddNote(),
        },
        home: const SafeArea(child: NotesView()),
      ),
    );
  }
}
