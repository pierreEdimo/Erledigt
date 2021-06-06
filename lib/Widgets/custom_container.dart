import 'package:erledigt/Constants/constants.dart';
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
      decoration: BoxDecoration(
        color: Color(0xffbffffff),
        borderRadius: onlyTop,
      ),
      child: child,
    );
  }
}
