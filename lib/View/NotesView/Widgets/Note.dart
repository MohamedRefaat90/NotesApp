import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/Models/NoteModel.dart';
import 'package:notes/View/NotesDetailes/NotesDetailes.dart';
import 'package:notes/View/NotesView/NoteView_cubit/notes_view_cubit.dart';

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
        Navigator.of(context).pushNamed(NotesDetailes.id, arguments: note);
      },
      onLongPress: () {
        CoolAlert.show(
          context: context,
          type: CoolAlertType.warning,
          showCancelBtn: true,
          text: "Your Sure Wanna to Delete this Note",
          confirmBtnText: "Yes",
          confirmBtnColor: Colors.green,
          cancelBtnText: "No",
          onConfirmBtnTap: () {
            note.delete();
            BlocProvider.of<NotesViewCubit>(context).fetchAllNotes();
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
            color: Color(note.color!),
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              '${note.note}',
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Align(alignment: Alignment.bottomRight,child: Text(note.date))
          ],
        ),
      ),
    );
  }
}
