import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/features/home/presentation/cubit/add_task/add_task_cubit.dart';

class NoteFiled extends StatelessWidget {
  const NoteFiled(
      {super.key,
      required this.title,
      this.maxLine,
      this.minLine,
      this.validator,
      this.onSaved});
  final String title;
  final int? maxLine;
  final int? minLine;

  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: minLine,
      maxLines: maxLine,
      autovalidateMode: BlocProvider.of<AddTaskCubit>(context).autovalidateMode,
      validator: validator,
      onSaved: onSaved,
      decoration: InputDecoration(
          label: Text(title), border: const OutlineInputBorder()),
    );
  }
}
