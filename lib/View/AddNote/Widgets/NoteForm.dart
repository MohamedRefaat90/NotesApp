import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/View/AddNote/AddNote_cubit/add_note_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'NoteField.dart';

class NoteForm extends StatefulWidget {
  const NoteForm({Key? key, required this.formkey}) : super(key: key);

  @override
  _NoteFormState createState() => _NoteFormState();

  final GlobalKey<FormState> formkey;
}

class _NoteFormState extends State<NoteForm> {
  String? noteTitle, noteDescription;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.formkey,
        child: Column(
          children: [
            NoteFiled(
              title: AppLocalizations.of(context)!.title,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return "Filed Must not be Empty";
                } else {
                  return null;
                }
              },
              onSaved: (value) {
                BlocProvider.of<AddNoteCubit>(context).title = value!;
              },
            ),
            const SizedBox(height: 20),
            NoteFiled(
              title: AppLocalizations.of(context)!.description,
              minLine: 3,
              maxLine: 5,
              onSaved: (value) {
                BlocProvider.of<AddNoteCubit>(context).description = value!;
              },
            ),
          ],
        ));
  }
}
