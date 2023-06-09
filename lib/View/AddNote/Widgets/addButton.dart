import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/View/AddNote/AddNote_cubit/add_note_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../NotesView/NoteView_cubit/notes_view_cubit.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key, required this.press});

  final void Function()? press;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      width: 150,
      height: 50,
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
          listener: (context, state) {
            if (state is AddNoteSuccess) {
              BlocProvider.of<NotesViewCubit>(context).fetchAllNotes();

              Navigator.of(context).pop();
            } else if (state is AddNoteFailure) {
              debugPrint('Fail');
            }
          },
          builder: (context, state) => MaterialButton(
                onPressed: press,
                color: Colors.purple.withOpacity(0.7),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child:  Text(AppLocalizations.of(context)!.add_note_btn, style: TextStyle(color: Colors.white),),
              )),
    ));
  }
}
