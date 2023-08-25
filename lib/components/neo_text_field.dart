import 'package:flutter/material.dart';

class NeoTextField extends StatelessWidget {
  const NeoTextField({
    super.key,
    this.controller,
    this.hintText,
    this.fillColor = Colors.white,
    this.shadowColor = Colors.black,
    this.foregroundColor,
    this.offset = const Offset(3, 3),
  });

  /// The [TextEditingController] to control the text being edited.
  final TextEditingController? controller;

  /// The text to display when the text field is empty.
  final String? hintText;

  /// The color to fill the background of the text field.
  final Color fillColor;

  /// The color to fill the shadow of the text field.
  final Color shadowColor;

  /// The color to fill the foreground of the text field.
  final Color? foregroundColor;

  /// The offset of the shadow of the text field.
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Colors.black,
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            offset: offset,
          ),
        ],
      ),
      child: TextField(
        cursorColor: foregroundColor,
        style: TextStyle(
          color: foregroundColor,
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: foregroundColor,
          ),
        ),
      ),
    );
  }
}
