import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';

class PlayPauseBTN extends StatefulWidget {
  const PlayPauseBTN({
    super.key,
    required this.noteVoice,
    this.controller,
  });

  final String noteVoice;
  final PlayerController? controller;

  @override
  State<PlayPauseBTN> createState() => _PlayPauseBTNState();
}

class _PlayPauseBTNState extends State<PlayPauseBTN> {
  bool isPlayed = true;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(!isPlayed ? Icons.pause : Icons.play_arrow, size: 40),
        tooltip: 'Play',
        onPressed: () async {
          if (!isPlayed) {
            await widget.controller!.pausePlayer();
            isPlayed = true;
            setState(() {});
          } else {
            await widget.controller!.startPlayer(finishMode: FinishMode.pause, forceRefresh: true);

            isPlayed = false;
            setState(() {});
          }
        });
  }
}
