// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget {
  const CircleContainer({
    Key? key,
    required this.color,
    this.child,
    required this.borderColor,
    this.borderWidth,
  }) : super(key: key);

  final Widget? child;
  final Color color;
  final double? borderWidth;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(9.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(
          width: borderWidth ?? 2,
          color: borderColor ?? color, // Use borderColor or default to color
        ),
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
