import 'package:flutter/material.dart';
import 'package:notes/View/AddNote/Widgets/AudioWave.dart';

import 'RecordeButton.dart';

bottomSheet(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return const BottomSheet();
      });
}

class BottomSheet extends StatelessWidget {
const BottomSheet({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
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