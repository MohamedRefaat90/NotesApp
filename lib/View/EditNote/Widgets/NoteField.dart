import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/View/AddNote/AddNote_cubit/add_note_cubit.dart';

class NoteFiled extends StatelessWidget {
  const NoteFiled(
      {super.key,
      required this.title,
      this.maxLine,
      this.minLine,
      this.onChanged});
  final String title;
  final int? maxLine;
  final int? minLine;

  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: minLine,
      maxLines: maxLine,
      autovalidateMode: BlocProvider.of<AddNoteCubit>(context).autovalidateMode,
      onChanged: onChanged,
      decoration: InputDecoration(
          hintText: title, border: const OutlineInputBorder()),
    );
  }
}
