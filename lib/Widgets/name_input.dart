import 'package:flutter/material.dart';

Widget nameInput(
  TextEditingController controller,
  String hinText,
) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: hinText,
    ),
  );
}
