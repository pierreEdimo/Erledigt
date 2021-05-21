import 'package:erledigt/Widgets/show_modal.dart';
import 'package:flutter/material.dart';

class CustomRoundedButton extends StatelessWidget {
  final Widget? child;
  final double? height;

  CustomRoundedButton({Key? key, this.child, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showCustomModal(child!, context, height!),
      child: Container(
        height: 60,
        width: 60,
        child: Center(
          child: Icon(
            Icons.add,
            color: Color(0xffbffffff),
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }
}
