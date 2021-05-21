import 'package:flutter/material.dart';

Widget userNameInput(TextEditingController usernameController) {
  return TextFormField(
    controller: usernameController,
    decoration:
        InputDecoration(labelText: 'Usermame', border: OutlineInputBorder()),
    keyboardType: TextInputType.text,
    validator: (value) {
      value = usernameController.text;
      if (value.isEmpty) return 'username is required';
      return null;
    },
  );
}
