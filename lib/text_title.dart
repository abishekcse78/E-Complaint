import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  const TextTitle({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(color: Colors.blue),
      textAlign: TextAlign.left,
    );
  }
}
