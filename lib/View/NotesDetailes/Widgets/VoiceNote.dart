import 'package:flutter/material.dart';
import 'package:audio_waveforms/audio_waveforms.dart';

import 'PlayPauseBTN.dart';

class VoiceNote extends StatelessWidget {
  const VoiceNote({
    super.key,
    this.noteVoice,
    this.controller,
    required this.waveColor,
  });
  final String? noteVoice;
  final PlayerController? controller;
  final int waveColor;
  @override
  Widget build(BuildContext context) {
    return noteVoice!.isEmpty
        ? Container()
        : Column(
            children: [
              Container(
                width: 350,
                height: 100,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(16)),
                child: Center(
                  child: AudioFileWaveforms(
                    size: Size(MediaQuery.of(context).size.width, 150.0),
                    playerController: controller!,
                    enableSeekGesture: true,
                    waveformType: WaveformType.long,
                    waveformData: const [],
                    playerWaveStyle: PlayerWaveStyle(
                      waveThickness: 5,
                      showSeekLine: false,
                      fixedWaveColor: Colors.white,
                      liveWaveColor: Color(waveColor),
                      spacing: 6,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PlayPauseBTN(controller: controller, noteVoice: noteVoice!),
                ],
              ),
            ],
          );
  }
}
