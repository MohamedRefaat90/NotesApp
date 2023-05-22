import 'package:flutter/material.dart';
import 'package:notes/View/NotesDetailes/Widgets/DocTile.dart';

import '../../../Models/NoteModel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DocsView extends StatefulWidget {
  const DocsView({
    super.key,
    required this.note,
  });

  final NoteModel note;

  @override
  State<DocsView> createState() => _DocsViewState();
}

class _DocsViewState extends State<DocsView> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return widget.note.docs!.length == 0
        ? Container()
        : Container(
            decoration: BoxDecoration(
                color: Color(widget.note.color!),
                borderRadius: BorderRadius.circular(16)),
            child: ExpansionTile(
              title: Text(AppLocalizations.of(context)!.docs),
              shape: Border.all(style: BorderStyle.none),
              onExpansionChanged: (value) {
                setState(() {
                  isExpanded = value;
                });
              },
              textColor: Colors.white,
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: widget.note.docs!.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: DocTile(
                      note: widget.note,
                      docIndex: index,
                    ),
                  ),
                  separatorBuilder: (context, index) => Divider(
                    height: 5,
                    indent: 50,
                    endIndent: 50,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          );
  }
}
