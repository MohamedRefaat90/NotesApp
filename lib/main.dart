import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/Models/NoteModel.dart';
import 'package:notes/blocObserver.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:notes/l10n/l10n.dart';
import 'View/AddNote/AddNote.dart';
import 'View/AddNote/AddNote_cubit/add_note_cubit.dart';
import 'View/EditNote/EditNote.dart';
import 'View/NotesDetailes/NotesDetailes.dart';
import 'View/NotesDetailes/NotesDetailes_cubit/notes_detailes_cubit.dart';
import 'View/NotesView/NoteView_cubit/notes_view_cubit.dart';
import 'View/NotesView/NotesView.dart';
import 'constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = myBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);

  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => NotesViewCubit()),
    BlocProvider(create: (context) => NotesDetailesCubit()),
    BlocProvider(create: (context) => AddNoteCubit()),
  ], child: const NotesApp()));
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesViewCubit, NotesViewState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Notes App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: BlocProvider.of<NotesViewCubit>(context).themeMode,
            useMaterial3: true,
            textTheme: TextTheme(
              bodySmall: TextStyle(fontFamily: "Almarai", color: Colors.white),
              bodyMedium: TextStyle(fontFamily: "Almarai"),
              bodyLarge: TextStyle(fontFamily: "Almarai"),
              titleMedium:
                  TextStyle(fontFamily: "Almarai", color: Colors.white),
              titleLarge: TextStyle(fontFamily: "Almarai"),
              labelLarge: TextStyle(fontFamily: "Almarai"),
            ),
          ),
          routes: {
            NotesView.id: (context) => const NotesView(),
            NotesDetailes.id: (context) => const NotesDetailes(),
            AddNote.id: (context) => const AddNote(),
            EditNote.id: (context) => EditNote(),
          },
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: l10n.all,
          home: SafeArea(child: NotesView()),
        );
      },
    );
  }
}
