import 'package:flutter/material.dart';

class ErrorMsgWidget extends StatelessWidget {
  final String errorMsg;
  const ErrorMsgWidget({
    super.key,
    required this.errorMsg,
  });
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errorMsg));
  }
}
