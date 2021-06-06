import 'package:erledigt/Model/task.dart';
import 'package:erledigt/Service/task_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoundCheckbox extends StatefulWidget {
  final Task? task;

  RoundCheckbox({Key? key, this.task}) : super(key: key);

  @override
  _RoundCheckboxState createState() => _RoundCheckboxState();
}

class _RoundCheckboxState extends State<RoundCheckbox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Task finishedTask = widget.task!;
        if (widget.task!.isComplete! != true) {
          finishedTask.isComplete = true;
        } else {
          finishedTask.isComplete = false;
        }

        setState(() {
          Provider.of<TaskService>(context, listen: false)
              .editTask(finishedTask);
        });
      },
      child: Container(
        width: 21.0,
        height: 21.0,
        margin: EdgeInsets.only(left: 5.0, right: 10.0),
        decoration: BoxDecoration(
          color: widget.task!.isComplete!
              ? Color(0xFFB000000)
              : Color(0xFFBFFFFFF),
          borderRadius: BorderRadius.circular(50.0),
          border: Border.all(
            color: Color(0xFFB000000),
          ),
        ),
        child: widget.task!.isComplete!
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
