import 'package:flutter/material.dart';

import 'Widgets/NoteDescription.dart';
import 'Widgets/NoteTitle.dart';
import 'Widgets/PickImage.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);
  static String id = 'AddNote';

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  dynamic selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NoteTitle(),
            const SizedBox(height: 20),
            const NoteDescription(),
            const SizedBox(height: 20),
            const pickImage(typeOfFile: "Image"),
            const SizedBox(height: 20),
            const pickImage(typeOfFile: "Voice"),
            const SizedBox(height: 50),
            Center(
                child: SizedBox(
                  width: 150,
                  height: 50,
                  child: MaterialButton(
                              onPressed: () {},
                              color: Colors.green.withOpacity(0.7),
                              shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                              child: const Text('Add Note'),
                            ),
                ))
          ],
        ),
      ),
    );
  }
}
