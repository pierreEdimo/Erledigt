import 'package:flutter/material.dart';

showCustomModal(
  Widget child,
  BuildContext context,
) {
  showModalBottomSheet<void>(
    isDismissible: true,
    isScrollControlled: true,
    context: context,
    builder: (context) => Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      color: Color(0xFF737373),
      child: Container(
        padding: EdgeInsets.all(25.0),
        color: Color(0xFFBFFFFFF),
        child: SingleChildScrollView(child: child),
      ),
    ),
  );
}
