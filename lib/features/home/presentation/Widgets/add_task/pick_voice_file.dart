// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../cubit/add_task/add_task_cubit.dart';
import 'bottom_sheet.dart';

class pickVoiceFile extends StatefulWidget {
  const pickVoiceFile({super.key});

  @override
  State<pickVoiceFile> createState() => _pickVoiceFileState();
}

class _pickVoiceFileState extends State<pickVoiceFile> {
  @override
  Widget build(BuildContext context) {
    AddTaskCubit cubit = BlocProvider.of<AddTaskCubit>(context);
    return SizedBox(
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.task_voice_title,
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
                      Text(AppLocalizations.of(context)!.pick_voice_hint),
                      BlocConsumer<AddTaskCubit, AddTaskState>(
                        listener: (context, state) {
                          if (state is AddTaskVoiceSuccess) {
                            cubit.pickVoiceSuccess = true;
                          } else if (state is AddTaskVoiceFailure) {
                            cubit.pickVoiceSuccess = false;
                          }
                        },
                        builder: (context, state) => CircleAvatar(
                            backgroundColor: cubit.pickVoiceSuccess
                                ? Colors.green
                                : Colors.red,
                            radius: 10,
                            child: Icon(
                              cubit.pickVoiceSuccess
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
                    value: 'Voice Task',
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(AppLocalizations.of(context)!.pick_voice),
                    ),
                    onTap: () {
                      cubit.pickAudioFile();
                    },
                  ),
                  DropdownMenuItem(
                      value: 'Recorde',
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child:
                            Text(AppLocalizations.of(context)!.recorde_voice),
                      ),
                      onTap: () async {
                        cubit.openBottomSheet(context);
                        await bottomSheet(context);
                      }),
                ],
              )),
            ),
          ],
        ));
  }
}
