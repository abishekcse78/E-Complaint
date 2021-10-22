import 'package:flutter/material.dart';

import 'non_variables/error_code.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown(
      {Key? key, required this.onChange, required this.selectedError})
      : super(key: key);

  final Function onChange;
  final String selectedError;

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> dropdownErrors = [];

    for (String error in errorList) {
      DropdownMenuItem<String> newError = DropdownMenuItem<String>(
        child: Text(error),
        value: error,
      );
      dropdownErrors.add(newError);
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton<String>(
        hint: Text(selectedError),
        items: dropdownErrors,
        dropdownColor: Colors.white.withOpacity(0.90),
        menuMaxHeight: 400,
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
        onChanged: (String? newValue) {
          onChange(newValue);
        },
        isExpanded: true,
      ),
    );
  }
}
