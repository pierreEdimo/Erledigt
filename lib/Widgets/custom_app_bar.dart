import 'package:flutter/material.dart';

PreferredSize customAppBar(
  Widget child,
) {
  return PreferredSize(
    child: SafeArea(child: child),
    preferredSize: Size.fromHeight(85.0),
  );
}
