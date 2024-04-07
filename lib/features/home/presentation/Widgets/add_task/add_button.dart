import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddTaskButton extends StatelessWidget {
  final void Function()? press;

  const AddTaskButton({super.key, required this.press});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      width: 150,
      height: 50,
      child: MaterialButton(
        onPressed: press,
        color: Colors.purple.withOpacity(0.7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Text(
          AppLocalizations.of(context)!.add_task_btn,
          style: TextStyle(color: Colors.white),
        ),
      ),
    ));
  }
}
