import 'package:flutter/material.dart';

Widget descriptionInput(
  TextEditingController controller,
) {
  return TextFormField(
    controller: controller,
    minLines: 3,
    maxLines: null,
    style: TextStyle(
      fontSize: 12.0,
    ),
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: 'please add a description',
      filled: true,
      fillColor: Colors.grey.shade100,
    ),
  );
}
