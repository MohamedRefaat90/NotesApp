import 'package:flutter/material.dart';
import 'package:audio_waveforms/audio_waveforms.dart';

import 'PlayPauseBTN.dart';
import 'StopBTN.dart';

class VoiceNote extends StatefulWidget {
  const VoiceNote({
    super.key,
    this.noteVoice,
  });
  final String? noteVoice;
  @override
  State<VoiceNote> createState() => _VoiceNoteState();
}

class _VoiceNoteState extends State<VoiceNote> {
  PlayerController controller = PlayerController();

  @override
  Widget build(BuildContext context) {
    return widget.noteVoice!.isEmpty
        ? Container()
        : Column(
            children: [
              Container(
                width: 350,
                height: 100,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(16)),
                child: Center(
                  child: AudioFileWaveforms(
                    size: Size(MediaQuery.of(context).size.width, 150.0),
                    playerController: controller,
                    enableSeekGesture: true,
                    waveformType: WaveformType.long,
                    waveformData: const [],
                    playerWaveStyle: const PlayerWaveStyle(
                      waveThickness: 5,
                      showSeekLine: false,
                      fixedWaveColor: Colors.white,
                      liveWaveColor: Color.fromARGB(255, 230, 135, 11),
                      spacing: 6,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  PlayPauseBTN(noteVoice: widget.noteVoice!),
                  const StopBTN(),
                ],
              ),
            ],
          );
  }
}
