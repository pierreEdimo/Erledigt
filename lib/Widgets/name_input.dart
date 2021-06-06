import 'package:flutter/material.dart';

Widget nameInput(
  TextEditingController controller,
  String hinText,
  bool autofocus,
) {
  return TextFormField(
    autofocus: autofocus,
    controller: controller,
    minLines: 1,
    maxLines: null,
    style: TextStyle(
      fontSize: 12.0,
      fontFamily: 'OpenSans',
    ),
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: hinText,
      filled: true,
      fillColor: Colors.grey.shade100,
    ),
  );
}
