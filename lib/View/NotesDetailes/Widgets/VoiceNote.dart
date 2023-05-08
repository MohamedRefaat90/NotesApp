import 'package:flutter/material.dart';
import 'package:audio_waveforms/audio_waveforms.dart';

class VoiceNote extends StatefulWidget {
  const VoiceNote({
    super.key,
  });

  @override
  State<VoiceNote> createState() => _VoiceNoteState();
}

class _VoiceNoteState extends State<VoiceNote> {
  // final hasPermission = await controller.checkPermission();
  @override
  Widget build(BuildContext context) {
    bool isRecording = false;
    RecorderController controller = RecorderController();
    return Column(
      children: [
        Center(
          child: Container(
            width: 350,
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(16)),
            child: Center(
              child: AudioWaveforms(
                enableGesture: true,
                size: Size(MediaQuery.of(context).size.width / 2, 70),
                recorderController: controller,
                waveStyle: const WaveStyle(
                  waveColor: Colors.white,
                  extendWaveform: true,
                  showMiddleLine: true,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: const Color(0xFF1E1B26),
                ),
                padding: const EdgeInsets.only(left: 18),
                margin: const EdgeInsets.symmetric(horizontal: 15),
              ),
            ),
          ),
        ),
        IconButton(
            icon: Icon(isRecording ? Icons.pause : Icons.mic),
            tooltip: 'Start recording',
            onPressed: () async {
              if (!isRecording) {
                // BlocProvider.of<AddNoteCubit>(context).startRecord();
              } else {
                isRecording = false;
                // final path = await controller.stop();
              }

              setState(() {});
            })
      ],
    );
  }
}
