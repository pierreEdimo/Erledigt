import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget? child;

  CustomContainer({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 25.0,
      ),
      child: child,
    );
  }
}
