// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/View/AddNote/AddNote_cubit/add_note_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../Models/NoteModel.dart';
import '../../AddNote/Widgets/bottomSheet.dart';

class EditVoiceFile extends StatefulWidget {
  const EditVoiceFile({super.key, this.note});
  final NoteModel? note;
  @override
  State<EditVoiceFile> createState() => _EditVoiceFileState();
}

class _EditVoiceFileState extends State<EditVoiceFile> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.note_voice_title,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocalizations.of(context)!.pick_voice_hint),
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
                            backgroundColor: widget.note!.record!.isNotEmpty
                                ? Colors.green
                                : Colors.red,
                            radius: 10,
                            child: Icon(
                              widget.note!.record!.isNotEmpty
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(AppLocalizations.of(context)!.pick_voice),
                    ),
                    onTap: () {
                      BlocProvider.of<AddNoteCubit>(context).pickAudioFile();
                    },
                  ),
                  DropdownMenuItem(
                      value: 'Recorde',
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child:
                            Text(AppLocalizations.of(context)!.recorde_voice),
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
