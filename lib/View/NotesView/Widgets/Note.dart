import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:notes/Models/NoteModel.dart';
import 'package:notes/View/NotesDetailes/NotesDetailes.dart';

class Note extends StatelessWidget {
  const Note({
    super.key,
    required this.note,
  });

  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(NotesDetailes.id);
      },
      onLongPress: () {
        CoolAlert.show(
          context: context,
          type: CoolAlertType.warning,
          showCancelBtn : true,
          text: "Your Sure Wanna to Delete this Note",
          confirmBtnText: "Yes",
          confirmBtnColor: Colors.green,
          cancelBtnText: "No",
          onConfirmBtnTap: () => note.delete(),
          
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.6),
            borderRadius: BorderRadius.circular(16)),
        child: ListTile(
          title: Text(
            note.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          subtitle: Text('${note.note}'),
        ),
      ),
    );
  }
}
