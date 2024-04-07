import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/features/home/presentation/Widgets/add_task/audio_wave.dart';
import 'package:notes/features/home/presentation/cubit/add_task/add_task_cubit.dart';

import 'recorde_button.dart';

bottomSheet(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return const myBottomSheet();
      });
}

class myBottomSheet extends StatelessWidget {
  const myBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: const BoxDecoration(color: Colors.teal),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [const AudioWave(), RecordeButton()],
      ),
    );
  }
}
