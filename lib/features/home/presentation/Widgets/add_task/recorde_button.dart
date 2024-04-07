import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../cubit/add_task/add_task_cubit.dart';

class RecordeButton extends StatefulWidget {
  const RecordeButton({
    super.key,
  });

  @override
  State<RecordeButton> createState() => _RecordeButtonState();
}

class _RecordeButtonState extends State<RecordeButton> {
  @override
  Widget build(BuildContext context) {
    bool isRecording = false;
    String txt = '';
    return BlocConsumer<AddTaskCubit, AddTaskState>(
        listener: (context, state) {
          if (state is AddTaskVoiceLoading) {
            isRecording = true;
            txt = AppLocalizations.of(context)!.start_record;
          } else if (state is AddTaskVoiceSuccess) {
            isRecording = false;
            txt = AppLocalizations.of(context)!.stop_record;
          }
        },
        builder: (context, state) => Column(
              children: [
                Text(
                  txt,
                  style: const TextStyle(fontSize: 30),
                ),
                CircleAvatar(
                  child: IconButton(
                      icon: Icon(isRecording ? Icons.pause : Icons.mic),
                      tooltip: 'Start recording',
                      onPressed: () async {
                        if (isRecording == false) {
                          BlocProvider.of<AddTaskCubit>(context).startRecord();
                        } else {
                          BlocProvider.of<AddTaskCubit>(context).stopRecode();
                          Navigator.pop(context);
                        }
                      }),
                ),
              ],
            ));
  }
}
