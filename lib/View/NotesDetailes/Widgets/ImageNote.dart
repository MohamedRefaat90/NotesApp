import 'package:flutter/material.dart';

class ImageNote extends StatelessWidget {
  const ImageNote({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350,
        height: 270,
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
