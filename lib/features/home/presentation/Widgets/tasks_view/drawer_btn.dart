import 'package:flutter/material.dart';

class DrawerBtn extends StatelessWidget {
  final IconData icon;

  final Color color;
  final String title;
  final void Function()? press;
  const DrawerBtn({
    super.key,
    required this.icon,
    required this.color,
    required this.title,
    this.press,
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        tileColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onTap: press,
      ),
    );
  }
}
