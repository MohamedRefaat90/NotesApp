import 'package:flutter/material.dart';

import '../AddNote/AddNote.dart';
import 'Widgets/Note.dart';
import 'Widgets/SearchField.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});
  
  static String id = 'NotesView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 24),
        child: Column(
          children: [
            const SearchField(),
            const SizedBox(height: 30),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, 
                    crossAxisSpacing: 10, 
                    mainAxisSpacing: 10),
                    itemCount: 12,
                itemBuilder: (context, index) => const Note(),
              ),
            )
          ],
        ),
      ),
    
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.of(context).pushNamed(AddNote.id);
      } , child: const Icon(Icons.add),),
    );
  }
}
