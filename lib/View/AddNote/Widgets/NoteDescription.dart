import 'package:flutter/material.dart';

class NoteDescription extends StatelessWidget {
  const NoteDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: 3,
      maxLines: 5,
      decoration: InputDecoration(
          label: Text('Note'), border: OutlineInputBorder()));
  }
}