import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/View/AddNote/AddNote_cubit/add_note_cubit.dart';
import 'package:notes/View/EditNote/Widgets/NoteField.dart';
import 'package:notes/View/NotesView/NoteView_cubit/notes_view_cubit.dart';

import '../../Models/NoteModel.dart';
import '../../constants.dart';
import '../AddNote/Widgets/ColorPallate.dart';
import '../AddNote/Widgets/pickDocument.dart';
import 'Widgets/EditImageFile.dart';
import 'Widgets/EditVoiceFile.dart';
import 'Widgets/editButton.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditNote extends StatefulWidget {
  const EditNote({Key? key}) : super(key: key);
  static String id = "EditNote";

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  @override
  Widget build(BuildContext context) {
    NoteModel note = ModalRoute.of(context)!.settings.arguments as NoteModel;
    String? title, description;
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.edit_note),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NoteFiled(
                  title: note.title,
                  onChanged: (value) {
                    title = value!;
                  },
                ),
                const SizedBox(height: 20),
                NoteFiled(
                  title: note.note ?? '',
                  minLine: 3,
                  maxLine: 5,
                  onChanged: (value) {
                    description = value!;
                  },
                ),
                const SizedBox(height: 20),
                EditImageFile(note: note),
                const SizedBox(height: 20),
                EditVoiceFile(note: note),
                const SizedBox(height: 20),
                pickDocument(),
                const SizedBox(height: 20),
                const ColorPallate(),
                const SizedBox(height: 20),
                EditButton(
                  press: () {
                    note.title = title ?? note.title;
                    note.note = description ?? note.note;
                    note.image =
                        BlocProvider.of<AddNoteCubit>(context).imgNote == ''
                            ? note.image
                            : BlocProvider.of<AddNoteCubit>(context).imgNote;
                    note.record =
                        BlocProvider.of<AddNoteCubit>(context).voiceNote == ''
                            ? note.record
                            : BlocProvider.of<AddNoteCubit>(context).voiceNote;
                    note.color = kNoteColors[
                        BlocProvider.of<AddNoteCubit>(context).selectedColor];
                    note.docs =
                        BlocProvider.of<AddNoteCubit>(context).docs.isEmpty
                            ? note.docs
                            : BlocProvider.of<AddNoteCubit>(context).docs;
                    note.save();
                    BlocProvider.of<NotesViewCubit>(context).fetchAllNotes();
                    BlocProvider.of<AddNoteCubit>(context).resetPickers();
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          ),
        ));
  }
}
