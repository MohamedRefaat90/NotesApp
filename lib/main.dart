import 'package:flutter/material.dart';
import 'package:notes/View/NotesDetailes/NotesDetailes.dart';

import 'View/AddNote/AddNote.dart';
import 'View/home/NotesView.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Botes App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, useMaterial3: true),
      routes: {
        NotesView.id :(context) => const NotesView(),
        NotesDetailes.id :(context) => const NotesDetailes(),
        AddNote.id :(context) =>  AddNote(),
      },
      home: const SafeArea(child: NotesView()),
    );
  }
}
