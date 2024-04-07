import 'dart:io';

import 'package:flutter/material.dart';

class ImageNote extends StatefulWidget {
  final String? img;
  const ImageNote({
    super.key,
    this.img,
  });
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
              height: 300,
              child: InteractiveViewer(
                  child: Image.file(
                File(widget.img!),
              )),
            ),
          );
  }
}
