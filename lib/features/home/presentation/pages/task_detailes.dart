import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/core/routing/app_routing.dart';
import 'package:notes/features/home/data/models/task_model.dart';

import '../Widgets/task_details/docs_view.dart';
import '../Widgets/task_details/task_image.dart';
import '../Widgets/task_details/voice_note.dart';

class NotesDetailes extends StatefulWidget {
  const NotesDetailes({super.key});

  @override
  State<NotesDetailes> createState() => _NotesDetailesState();
}

class _NotesDetailesState extends State<NotesDetailes> {
  PlayerController? player;

  @override
  Widget build(BuildContext context) {
    TaskModel note = GoRouterState.of(context).extra as TaskModel;
    initRecorder(note.record);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
        actions: [
          IconButton(
            onPressed: () {
              context.pushNamed(AppRouter.editTask, extra: note);

              player!.pausePlayer();
            },
            icon: const Icon(Icons.edit),
            tooltip: AppLocalizations.of(context)!.edit_task,
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
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.07,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
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
    );
  }

  @override
  void dispose() {
    player!.dispose();
    player = null;
    super.dispose();
  }

  initRecorder(VoiceNote) async {
    await player!.preparePlayer(
      path: VoiceNote,
      shouldExtractWaveform: true,
      noOfSamples: 100,
      volume: 1.0,
    );
  }

  @override
  void initState() {
    player = PlayerController();
    super.initState();
  }
}
