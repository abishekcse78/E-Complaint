import 'package:flutter/material.dart';

import '../non_variables/constants.dart';

class TextFieldContent extends StatelessWidget {
  const TextFieldContent({required this.hint});

  final String hint;
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.black),
      onChanged: (value) {
        //Do something with the user input.
      },
      decoration: kTextFieldDecoration.copyWith(hintText: hint),
    );
  }
}
