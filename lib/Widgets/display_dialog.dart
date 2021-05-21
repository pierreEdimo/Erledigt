import 'package:flutter/material.dart';

void displayDialog(context, title, text) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
        ),
        content: Text(
          text,
          style: TextStyle(fontSize: 14.0),
        ),
      ),
    );
