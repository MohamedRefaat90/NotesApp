// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class pickImage extends StatefulWidget {
  const pickImage({super.key, required this.typeOfFile});

  final String typeOfFile;
  @override
  State<pickImage> createState() => _pickImageState();
}

class _pickImageState extends State<pickImage> {
  dynamic selected;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pick ${widget.typeOfFile} For Note',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                  color: Colors.purple.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(16)),
              child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                value: selected,
                hint: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(selected.toString() == "null"
                      ? "Pick ${widget.typeOfFile}"
                      : selected.toString()),
                ),
                isExpanded: true,
                items: [
                  DropdownMenuItem(
                      value: 'Gallrey',
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(widget.typeOfFile == "Voice"
                            ? 'Pick Voice Recorde'
                            : "Pick From Gallery"),
                      )),
                  DropdownMenuItem(
                      value: 'Camera',
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(widget.typeOfFile == "Voice"
                            ? 'Recorde Voice Note'
                            : "Capture Image "),
                      )),
                ],
                onChanged: (value) {
                  setState(() {
                    selected = value;
                  });
                },
                borderRadius: BorderRadius.circular(16),
                dropdownColor: Colors.purple,
              )),
            ),
          ],
        ));
  }
}
