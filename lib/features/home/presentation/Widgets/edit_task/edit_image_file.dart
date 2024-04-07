// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../data/models/task_model.dart';
import '../../cubit/add_task/add_task_cubit.dart';

class EditImageFile extends StatefulWidget {
  final TaskModel? task;
  const EditImageFile({super.key, this.task});
  @override
  State<EditImageFile> createState() => _EditImageFileState();
}

class _EditImageFileState extends State<EditImageFile> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.task_Image_title,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                  color: Colors.purple.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(16)),
              child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                hint: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocalizations.of(context)!.pick_Image_hint),
                      BlocConsumer<AddTaskCubit, AddTaskState>(
                        listener: (context, state) {
                          if (state is AddTaskImageSuccess) {
                            BlocProvider.of<AddTaskCubit>(context)
                                .pickImageSuccess = true;
                          } else if (state is AddTaskImageFailure) {
                            BlocProvider.of<AddTaskCubit>(context)
                                .pickImageSuccess = false;
                          }
                        },
                        builder: (context, state) => CircleAvatar(
                            backgroundColor: widget.task!.image!.isEmpty
                                ? Colors.green
                                : Colors.red,
                            radius: 10,
                            child: Icon(
                              widget.task!.image!.isEmpty
                                  ? Icons.done
                                  : Icons.cancel_outlined,
                              size: 20,
                              color: Colors.white,
                            )),
                      )
                    ],
                  ),
                ),
                isExpanded: true,
                borderRadius: BorderRadius.circular(16),
                dropdownColor: Colors.purple,
                onChanged: (value) {},
                items: [
                  DropdownMenuItem(
                    value: 'Gallery',
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(AppLocalizations.of(context)!.pick_image),
                    ),
                    onTap: () {
                      BlocProvider.of<AddTaskCubit>(context)
                          .pickImage("Gallery");
                    },
                  ),
                  DropdownMenuItem(
                      value: 'Camera',
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child:
                            Text(AppLocalizations.of(context)!.capture_image),
                      ),
                      onTap: () async {
                        BlocProvider.of<AddTaskCubit>(context)
                            .pickImage("Camera");
                      }),
                ],
              )),
            ),
          ],
        ));
  }
}
