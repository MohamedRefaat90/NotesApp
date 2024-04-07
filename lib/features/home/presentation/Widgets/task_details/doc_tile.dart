import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/features/home/presentation/cubit/add_task/add_task_cubit.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path/path.dart' as path;

import '../../../data/models/task_model.dart';

class DocTile extends StatelessWidget {
  final TaskModel note;

  final int docIndex;
  const DocTile({
    super.key,
    required this.note,
    required this.docIndex,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      style: ListTileStyle.list,
      leading: Image.asset(BlocProvider.of<AddTaskCubit>(context)
          .imageofDoc(note.docs![docIndex])),
      title: Text(
        path.basename(note.docs![docIndex]),
        style: TextStyle(color: Colors.white),
      ),
      onTap: () {
        OpenFilex.open(File(note.docs![docIndex]).path);
      },
    );
  }
}
