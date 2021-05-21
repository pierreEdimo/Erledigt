import 'package:flutter/material.dart';

Widget gotoSignUp(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("Does not have an account ?"),
      TextButton(
        onPressed: () => Navigator.of(context).pushNamed('/logup'),
        child: Text("Sign Up"),
      )
    ],
  );
}
