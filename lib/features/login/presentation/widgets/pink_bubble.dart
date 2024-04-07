import 'package:flutter/material.dart';

class PinkBubble extends StatelessWidget {
  final double yOffest;
  final double xOffest;
  final Color color;
  const PinkBubble({
    super.key,
    required this.yOffest,
    required this.xOffest,
    required this.color,
  });
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: yOffest,
      right: xOffest,
      child: Container(
          width: 200,
          height: 250,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(500),
              boxShadow: [
                BoxShadow(blurRadius: 150, color: color, spreadRadius: 100)
              ])),
    );
  }
}
