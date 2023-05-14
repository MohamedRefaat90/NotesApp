import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../AddNote_cubit/add_note_cubit.dart';

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
    return BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteVoiceLoading) {
            isRecording = true;
            txt = 'Start Recording';
          } else if (state is AddNoteVoiceSuccess) {
            isRecording = false;
            txt = 'End Recording';
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
                          BlocProvider.of<AddNoteCubit>(context).startRecord();
                        } else {
                          BlocProvider.of<AddNoteCubit>(context).stopRecode();
                          Navigator.pop(context);
                        }
                      }),
                ),
              ],
            ));
  }
}
