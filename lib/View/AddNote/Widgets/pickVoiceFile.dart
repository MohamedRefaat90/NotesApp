// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/View/AddNote/AddNote_cubit/add_note_cubit.dart';
import 'package:flutter/material.dart';

import 'bottomSheet.dart';

class pickVoiceFile extends StatelessWidget {
  const pickVoiceFile({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pick Voice For Note',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                  color: Colors.purple.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(16)),
              child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                hint: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Pick Voice"),
                      BlocConsumer<AddNoteCubit, AddNoteState>(
                        listener: (context, state) {
                          if (state is AddNoteVoiceSuccess) {
                            BlocProvider.of<AddNoteCubit>(context)
                                .pickVoiceSuccess = true;
                          } else if (state is AddNoteVoiceFailure) {
                            BlocProvider.of<AddNoteCubit>(context)
                                .pickVoiceSuccess = false;
                          }
                        },
                        builder: (context, state) => CircleAvatar(
                            backgroundColor:
                                BlocProvider.of<AddNoteCubit>(context)
                                        .pickVoiceSuccess
                                    ? Colors.green
                                    : Colors.red,
                            radius: 10,
                            child: Icon(
                              BlocProvider.of<AddNoteCubit>(context)
                                      .pickVoiceSuccess
                                  ? Icons.done
                                  : Icons.cancel_outlined,
                              size: 20,
                              color: Colors.white,
                            )),
                      )
                    ],
                  ),
                ),
                isExpanded: true,
                borderRadius: BorderRadius.circular(16),
                dropdownColor: Colors.purple,
                onChanged: (value) {},
                items: [
                  DropdownMenuItem(
                    value: 'Voice Note',
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('Pick Voice Note'),
                    ),
                    onTap: () {
                      BlocProvider.of<AddNoteCubit>(context).pickAudioFile();
                    },
                  ),
                  DropdownMenuItem(
                      value: 'Recorde',
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('Recorde Voice Note'),
                      ),
                      onTap: () async {
                        BlocProvider.of<AddNoteCubit>(context)
                            .openBottomSheet(context);
                        bottomSheet(context);
                      }),
                ],
              )),
            ),
          ],
        ));
  }
}
