import 'package:flutter/material.dart';

Widget customListTile(
  Icon icon,
  String title,
) {
  return Row(
    children: [
      icon,
      SizedBox(
        width: 25.0,
      ),
      Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ],
  );
}
