import 'package:flutter/material.dart';
import 'package:notes/View/NotesDetailes/NotesDetailes.dart';

class Note extends StatelessWidget {
  const Note({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed(NotesDetailes.id);
        
      },
      onLongPress: (){
        print("Long Pressed");
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.6),
            borderRadius: BorderRadius.circular(16)),
        child: const ListTile(
          title: Text(
            'First Note',
            style: TextStyle(fontSize: 20),
          ),
          // subtitle: Text(
          //     'Description of Note will Display Here, Description of Note'),
        ),
      ),
    );
  }
}
