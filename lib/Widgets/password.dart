import 'package:flutter/material.dart';

Widget passwordInput(TextEditingController passwordController) {
  return TextFormField(
    controller: passwordController,
    decoration:
        InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
    obscureText: true,
    keyboardType: TextInputType.visiblePassword,
    validator: (value) {
      value = passwordController.text;
      if (value.isEmpty) return 'password is required';
      if (value.length < 7) return 'password is weak';
      return null;
    },
  );
}
