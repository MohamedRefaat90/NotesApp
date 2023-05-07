import 'package:flutter/material.dart';

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
              title: "Title",
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return "Filed Must not be Empty";
                } else {
                  return null;
                }
              },
              onSaved: (value) {
                noteTitle = value;
              },
            ),
            const SizedBox(height: 20),
            NoteFiled(
              title: "Note Description",
              minLine: 3,
              maxLine: 5,
              onSaved: (value) {
                noteDescription = value;
              },
            ),
          ],
        ));
  }
}
