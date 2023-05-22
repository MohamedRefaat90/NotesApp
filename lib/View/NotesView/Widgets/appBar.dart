import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../NoteView_cubit/notes_view_cubit.dart';
Locale en = Locale('en'); 
PreferredSizeWidget appBar(themeMode, context) {
  return AppBar(
    title: Text(
      AppLocalizations.of(context)!.notes,
      style:  TextStyle(
          fontWeight: FontWeight.w700,
          fontFamily: window.locale.languageCode == 'en'?  'Dancing Script' : 'Lemonada',
          fontSize: window.locale.languageCode == 'en'? 40 : 25),
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
