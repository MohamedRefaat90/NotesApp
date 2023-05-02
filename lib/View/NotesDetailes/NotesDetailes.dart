import 'package:flutter/material.dart';

import 'Widgets/ImageNote.dart';
import 'Widgets/VoiceNote.dart';

class NotesDetailes extends StatelessWidget {
  const NotesDetailes({super.key});
  static String id = "NotesDetailes";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}

