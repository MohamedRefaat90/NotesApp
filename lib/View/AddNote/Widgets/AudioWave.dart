import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../AddNote_cubit/add_note_cubit.dart';

class AudioWave extends StatelessWidget {
  const AudioWave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AudioWaveforms(
      enableGesture: true,
      size: const Size(300, 70),
      recorderController: BlocProvider.of<AddNoteCubit>(context).controller,
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
    );
  }
}
