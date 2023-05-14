import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../NotesDetailes_cubit/notes_detailes_cubit.dart';

class StopBTN extends StatelessWidget {
  const StopBTN({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.stop, size: 40),
        tooltip: 'Stop',
        onPressed: () async {});
  }
}
