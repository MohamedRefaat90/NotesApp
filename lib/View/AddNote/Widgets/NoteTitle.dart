import 'package:flutter/material.dart';

class NoteTitle extends StatelessWidget {
  const NoteTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
          label: Text('Title'), border: OutlineInputBorder()),
    );
  }
}