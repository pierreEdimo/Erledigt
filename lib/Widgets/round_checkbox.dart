import 'package:erledigt/Service/task_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoundCheckbox extends StatefulWidget {
  final bool? isFinished;
  final int? taskId;

  RoundCheckbox({Key? key, this.isFinished, this.taskId}) : super(key: key);

  @override
  _RoundCheckboxState createState() => _RoundCheckboxState();
}

class _RoundCheckboxState extends State<RoundCheckbox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.isFinished == false) {
          Provider.of<TaskService>(context, listen: false)
              .patchTask(true, widget.taskId!);
        }
        Provider.of<TaskService>(context, listen: false)
            .patchTask(false, widget.taskId!);
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.isFinished! ? Color(0xFFB000000) : Color(0xFFBFFFFFF),
          border: Border.all(
            color: Color(0xFFB000000),
          ),
        ),
        padding: EdgeInsets.all(5.0),
        child: widget.isFinished!
            ? Icon(
                Icons.check,
                size: 10.0,
                color: Color(0xFFBFFFFFF),
              )
            : Icon(
                Icons.check_box_outline_blank,
                size: 10.0,
                color: Colors.transparent,
              ),
      ),
    );
  }
}
