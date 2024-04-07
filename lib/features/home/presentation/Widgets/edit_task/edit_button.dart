import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditButton extends StatelessWidget {
  const EditButton({super.key, required this.press});

  final void Function()? press;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          width: 150,
          height: 50,
          child: MaterialButton(
            onPressed: press,
            color: Colors.purple.withOpacity(0.7),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Text(
              AppLocalizations.of(context)!.edit_task,
              style: TextStyle(color: Colors.white),
            ),
          )),
    );
  }
}
