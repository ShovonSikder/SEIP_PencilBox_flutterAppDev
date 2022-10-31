import 'package:flutter/material.dart';

List<DropdownMenuItem> courses = [
  DropdownMenuItem(
    child: Text(
      'Select a course',
    ),
    value: '',
  ),
  DropdownMenuItem(
    child: Text(
      'Android',
    ),
    value: 'android',
  ),
  DropdownMenuItem(
    child: Text(
      'Laravel',
    ),
    value: 'laravel',
  ),
  DropdownMenuItem(
    child: Row(
      children: [
        Icon(Icons.label_important_outlined),
        Text(
          'UI/UX',
        ),
      ],
    ),
    value: 'uiux',
  )
];
