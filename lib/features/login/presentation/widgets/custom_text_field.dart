import 'package:flutter/material.dart';

IconData togglePasswordVisiabiltyIcon(bool passwordVisiabilty) {
  if (passwordVisiabilty) {
    return Icons.visibility_outlined;
  } else {
    return Icons.visibility_off_outlined;
  }
}

class CustomTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String placeholderText;
  final bool isPass;
  const CustomTextField({
    required this.textEditingController,
    super.key,
    required this.placeholderText,
    required this.isPass,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool passwordVisiabilty = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      obscureText: passwordVisiabilty,
      decoration: InputDecoration(
          enabled: true,
          contentPadding: const EdgeInsets.all(15),
          filled: true,
          suffixIcon: widget.isPass
              ? IconButton(
                  onPressed: () {
                    setState(() => passwordVisiabilty = !passwordVisiabilty);
                  },
                  icon: Icon(togglePasswordVisiabiltyIcon(passwordVisiabilty)))
              : null,
          hintText: widget.placeholderText,
          hintStyle: TextStyle(color: Colors.grey),
          fillColor: Colors.white,
          border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(50)))),
    );
  }
}
