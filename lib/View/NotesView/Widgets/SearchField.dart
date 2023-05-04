import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TextField(
      autofocus: false,
      decoration: InputDecoration(
        hintText: "Search For Note",
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
        border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.all(Radius.circular(16)))),
    );
  }
}
