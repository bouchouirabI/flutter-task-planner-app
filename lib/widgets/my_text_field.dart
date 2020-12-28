import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String label;
  final int maxLines;
  final int minLines;
  final Icon icon;
  final Icon prefixIcon;
  MyTextField({this.label, this.maxLines = 1, this.minLines = 1, this.icon, this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
          color: Colors.black87
      ),
      minLines: minLines,
      maxLines: maxLines,
      decoration: InputDecoration(
          suffixIcon: icon == null ? null: icon,
          labelText: label,
          prefixIcon: prefixIcon,
          labelStyle: TextStyle(color: Colors.black54),
          focusedBorder:
              UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
          border:
              UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey))
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },

    );
  }
}
