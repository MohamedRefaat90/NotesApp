import 'package:flutter/material.dart';


class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      width: 150,
      height: 50,
      child: MaterialButton(
        onPressed: () {},
        color: Colors.green.withOpacity(0.7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: const Text('Add Note'),
      ),
    ));
  }
}
