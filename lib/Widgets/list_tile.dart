import 'package:flutter/material.dart';

Widget listTile(Icon icon, String title) {
  return ListTile(
    leading: icon,
    title: Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
  );
}
