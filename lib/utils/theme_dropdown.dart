

import 'package:flutter/material.dart';
import 'package:stress_management_app/utils/constants.dart';

const List<String> list = <String>['Dark', 'Light',];

class ThemeDropdown extends StatefulWidget {
  const ThemeDropdown({super.key});

  @override
  State<ThemeDropdown> createState() => _ThemeDropdownState();
}

class _ThemeDropdownState extends State<ThemeDropdown> {
  
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isDense: true,
      // isExpanded: true,
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.white70),
      dropdownColor: kModelBlack,
      underline: Container(
        height: 2,
        color: Colors.white60,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
