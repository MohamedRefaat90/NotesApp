import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

flushBar(BuildContext context, String message) {
  Flushbar(
          flushbarPosition: FlushbarPosition.BOTTOM,
          icon: const Icon(Icons.info_outline, color: Color(0xFFF56242)),
          backgroundColor: Colors.red,
          message: message.toUpperCase(),
          messageSize: 16,
          messageColor: Colors.white,
          duration: const Duration(seconds: 4))
      .show(context);
}
