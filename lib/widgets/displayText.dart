// ignore: file_names
import 'package:flutter/material.dart';
import 'package:todoapp/utils/utils.dart';
// ignore: depend_on_referenced_packages

class DisplayText extends StatelessWidget {
  const DisplayText(
      {super.key, required this.text, this.fontSize, this.fontWeight});

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.textTheme.headlineSmall?.copyWith(
        color: context.colorScheme.surface,
        fontWeight: fontWeight ?? FontWeight.bold,
        fontSize: fontSize,
      ),
    );
  }
}
