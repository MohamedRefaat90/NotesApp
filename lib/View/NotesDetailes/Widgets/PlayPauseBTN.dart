import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../NotesDetailes_cubit/notes_detailes_cubit.dart';
import 'VoiceNote.dart';

class PlayPauseBTN extends StatelessWidget {
  const PlayPauseBTN({
    super.key, required this.noteVoice,

  });

final String noteVoice;

  @override
  Widget build(BuildContext context) {
    bool isPlayed = false;
    return BlocConsumer<NotesDetailesCubit, NotesDetailesState>(
      listener: (context, state) {
        if (state is NotesDetailesLoading) {
          isPlayed = true;
        } else if (state is NotesDetailesSuccess) {
          isPlayed = false;
        }
      },
      builder: (context, state) {
        return IconButton(
            icon: Icon(isPlayed ? Icons.pause : Icons.play_arrow, size: 40),
            tooltip: 'Play',
            onPressed: () async {
        
            });
      },
    );
  }
}
