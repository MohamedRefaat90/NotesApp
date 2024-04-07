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

class _PlayPauseBTNState extends State<PlayPauseBTN>
    with TickerProviderStateMixin {
  late bool isPlayed;
  AnimationController? controller;

  @override
  void initState() {
    isPlayed = false;
    controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 400),
        reverseDuration: Duration(milliseconds: 400));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          progress: controller!,
          icon: AnimatedIcons.pause_play,
          size: 40,
          color: Colors.white,
        ),
        tooltip: 'Play/Pause',
        onPressed: () async {
          if (isPlayed) {
            setState(() {
              isPlayed = false;
            });
            await widget.controller!.pausePlayer();
            controller!.forward();
          } else {
            setState(() {
              isPlayed = true;
            });
            await widget.controller!
                .startPlayer(finishMode: FinishMode.pause, forceRefresh: true);
            controller!.reverse();
          }
        });
  }
}
