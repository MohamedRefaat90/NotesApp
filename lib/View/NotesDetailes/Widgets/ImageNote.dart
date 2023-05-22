import 'dart:io';

import 'package:flutter/material.dart';

class ImageNote extends StatefulWidget {
  const ImageNote({
    super.key,
    this.img,
  });
  final String? img;
  @override
  State<ImageNote> createState() => _ImageNoteState();
}

class _ImageNoteState extends State<ImageNote> {
  @override
  Widget build(BuildContext context) {
    return widget.img!.isEmpty
        ? Container()
        : Center(
            child: SizedBox(
              width: 370,
              height: 270,
              child: InteractiveViewer(
                  child: Image.file(
                File(widget.img!),
              )),
            ),
          );
  }
}
