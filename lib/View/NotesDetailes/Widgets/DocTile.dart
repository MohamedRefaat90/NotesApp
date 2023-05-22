import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/View/AddNote/AddNote_cubit/add_note_cubit.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path/path.dart' as path;
import '../../../Models/NoteModel.dart';

class DocTile extends StatelessWidget {
  const DocTile({
    super.key,
    required this.note,
    required this.docIndex,
  });

  final NoteModel note;
  final int docIndex;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      style: ListTileStyle.list,
      leading: Image.asset(BlocProvider.of<AddNoteCubit>(context)
          .imageofDoc(note.docs![docIndex])),
      title: Text(
        path.basename(note.docs![docIndex]),
        style: TextStyle(color: Colors.white),
      ),
      onTap: () {
        OpenFilex.open(File(note.docs![docIndex]).path);
      },
    );
  }
}
