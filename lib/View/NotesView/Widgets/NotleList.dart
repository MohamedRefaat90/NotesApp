import 'package:flutter/material.dart';
import 'package:notes/View/NotesView/Widgets/Note.dart';

import '../../../Models/NoteModel.dart';

class NotesList extends StatelessWidget {
  const NotesList({
    super.key,
    required this.notesList,
  });

  final List<NoteModel> notesList;

  @override
  Widget build(BuildContext context) {
    
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
        itemCount: notesList.length,
        itemBuilder: (context, index) => Note(note: notesList[index] ),
      ),
    );
  }
}
