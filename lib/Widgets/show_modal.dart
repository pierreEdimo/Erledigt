import 'package:flutter/material.dart';

showCustomModal(
  Widget child,
  BuildContext context,
  double height,
) {
  showModalBottomSheet<void>(
    isDismissible: true,
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return Container(
        color: Color(0xFF737373),
        child: Container(
          height: height,
          padding: EdgeInsets.all(25.0),
          color: Color(0xFFBFFFFFF),
          child: child,
        ),
      );
    },
  );
}
