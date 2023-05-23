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
        : Container(
            padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 10),
            decoration: BoxDecoration(
                color: Colors.black87, borderRadius: BorderRadius.circular(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: AudioFileWaveforms(
                    size: Size(MediaQuery.of(context).size.width, 60),
                    playerController: controller!,
                    enableSeekGesture: true,
                    waveformType: WaveformType.long,
                    waveformData: const [],
                    playerWaveStyle: PlayerWaveStyle(
                      waveThickness: 5,
                      showSeekLine: false,
                      fixedWaveColor: Colors.white,
                      liveWaveColor: Color(waveColor),
                      spacing: 7,
                    ),
                  ),
                ),
                PlayPauseBTN(controller: controller, noteVoice: noteVoice!)
              ],
            ),
          );
  }
}
