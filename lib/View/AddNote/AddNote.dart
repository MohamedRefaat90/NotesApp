import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/View/AddNote/AddNote_cubit/add_note_cubit.dart';

import 'Widgets/NoteField.dart';
import 'Widgets/NoteForm.dart';
import 'Widgets/pickImageFile.dart';
import 'Widgets/addButton.dart';
import 'Widgets/pickVoiceFile.dart';

class AddNote extends StatefulWidget {
  static String id = 'AddNote';

  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Note'),
      ),
      body: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NoteForm(formkey: formkey),
                  const SizedBox(height: 20),
                  const pickImageFile(),
                  const SizedBox(height: 20),
                  const pickVoiceFile(),
                  const SizedBox(height: 50),
                  AddButton(
                    press: () {
                      if (formkey.currentState!.validate()) {
                        formkey.currentState!.save();

                      }else{
                        BlocProvider.of<AddNoteCubit>(context).autovalidateMode = AutovalidateMode.always;
                        setState(() {
                          
                        });
                      }
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

