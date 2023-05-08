import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes/View/AddNote/AddNote_cubit/add_note_cubit.dart';

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
            Navigator.of(context).pop();
          } else if (state is AddNoteFailure) {
            debugPrint('Fail');
          }
        },
        builder: (context, state) {
          return MaterialButton(
            onPressed: press,
            color: Colors.green.withOpacity(0.7),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ModalProgressHUD(
                inAsyncCall: state is AddNoteLoading ? true : false,
                child: state is AddNoteLoading
                    ? const CircularProgressIndicator.adaptive()
                    : const Text('Add Note')),
          );
        },
      ),
    ));
  }
}
