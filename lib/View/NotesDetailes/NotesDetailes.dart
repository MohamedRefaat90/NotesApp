import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/Models/NoteModel.dart';
import 'package:notes/View/EditNote/EditNote.dart';

import 'NotesDetailes_cubit/notes_detailes_cubit.dart';
import 'Widgets/DocsView.dart';
import 'Widgets/ImageNote.dart';
import 'Widgets/VoiceNote.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotesDetailes extends StatefulWidget {
  const NotesDetailes({super.key});
  static String id = "NotesDetailes";

  @override
  State<NotesDetailes> createState() => _NotesDetailesState();
}

class _NotesDetailesState extends State<NotesDetailes> {
  PlayerController? player;
  @override
  void initState() {
    player = PlayerController();

    super.initState();
  }

  @override
  void dispose() {
    player!.dispose();
    player = null;
    print("=======================================");
    print("Disposed");
    print("=======================================");
    super.dispose();
  }

  x(VoiceNote) async {
    await player!.preparePlayer(
      path: VoiceNote,
      shouldExtractWaveform: true,
      noOfSamples: 100,
      volume: 1.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    NoteModel note = ModalRoute.of(context)!.settings.arguments as NoteModel;
    x(note.record);
    return BlocProvider(
      create: (context) => NotesDetailesCubit(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, EditNote.id, arguments: note);
              },
              icon: const Icon(Icons.edit),
              tooltip: AppLocalizations.of(context)!.edit_note,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  note.title,
                  style: const TextStyle(fontSize: 40),
                ),
                Text(note.note ?? ""),
                SizedBox(height: note.note == "" ? 0 : 30),
                ImageNote(img: note.image),
                const SizedBox(height: 30),
                VoiceNote(
                    controller: player,
                    noteVoice: note.record,
                    waveColor: note.color!),
                SizedBox(height: 20),
                DocsView(note: note)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
