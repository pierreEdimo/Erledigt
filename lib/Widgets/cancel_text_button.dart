import 'package:flutter/material.dart';

Widget cancelTextButton(BuildContext context) {
  return TextButton(
    onPressed: () => Navigator.of(context).pop(),
    child: Text(
      'cancel',
      style: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
