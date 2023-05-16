import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../NoteView_cubit/notes_view_cubit.dart';

PreferredSizeWidget appBar(themeMode, context) {
  return AppBar(
    title: const Text(
      'Notes',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 29),
    ),
    elevation: 0,
    actions: [
      IconButton(
          onPressed: () {
            BlocProvider.of<NotesViewCubit>(context).changeTheme();
          },
          icon: Icon(
            themeMode == Brightness.dark ? Icons.sunny : Icons.nightlight_sharp,
            size: 30,
            color: themeMode == Brightness.dark ? Colors.white : Colors.black87,
          ))
    ],
  );
}
