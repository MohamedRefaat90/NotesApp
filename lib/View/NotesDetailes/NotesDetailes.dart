import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'NotesDetailes_cubit/notes_detailes_cubit.dart';
import 'Widgets/ImageNote.dart';
import 'Widgets/VoiceNote.dart';

class NotesDetailes extends StatelessWidget {
  const NotesDetailes({super.key});
  static String id = "NotesDetailes";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesDetailesCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Title',
                style: TextStyle(fontSize: 40),
              ),
              SizedBox(height: 10),
              Text(
                  'dkdfkmsdklfnlksdnflkdsnklfnksldnflkdnfklndslkfnlkdsnklfnsdlknflksdnflkndslkfnlkdsnflkdnflknsdlknflkdsnflksndklfnsdklnflskdnflksdnfkldnfkldskl'),
              SizedBox(height: 30),
              ImageNote(),
              SizedBox(height: 30),
              VoiceNote()
            ],
          ),
        ),
      ),
    );
  }
}
