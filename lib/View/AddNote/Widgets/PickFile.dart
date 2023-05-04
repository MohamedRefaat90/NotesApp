// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/View/AddNote/AddNote_cubit/add_note_cubit.dart';
import 'package:flutter/material.dart';

import 'bottomSheet.dart';

class pickFile extends StatelessWidget {
  String typeOfFile = '';

  pickFile({super.key, required this.typeOfFile});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pick $typeOfFile For Note',
              style: const TextStyle(fontSize: 20),
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
                  child: Text("Pick $typeOfFile"),
                ),
                isExpanded: true,
                onChanged: (value) {

                },
                items: [
                  DropdownMenuItem(
                    value: 'Voice Note',
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(typeOfFile == "Voice"
                          ? 'Pick Voice Note'
                          : "Pick From Gallery"),
                    ),
                    onTap: () {
                      if (typeOfFile == "Voice") {
                        
                      } else {
                        BlocProvider.of<AddNoteCubit>(context)
                            .pickImage("Gallery");
                      }
                    },
                  ),
                  DropdownMenuItem(
                      value: 'Recorde',
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(typeOfFile == "Voice"
                            ? 'Recorde Voice Note'
                            : "Capture Image "),
                      ),
                      onTap: () async {
                        if (typeOfFile == "Voice") {
                          BlocProvider.of<AddNoteCubit>(context)
                              .openBottomSheet(context);
                          // bottomSheet(context);
                        } else {
                          
                          BlocProvider.of<AddNoteCubit>(context)
                              .pickImage("Camera");
                        }
                      }),
                ],
                borderRadius: BorderRadius.circular(16),
                dropdownColor: Colors.purple,
              )),
            ),
          ],
        ));
  }
}
