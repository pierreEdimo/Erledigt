import 'package:erledigt/Model/task.dart';
import 'package:erledigt/Service/task_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Star extends StatefulWidget {
  final Task? task;
  const Star({
    Key? key,
    this.task,
  }) : super(key: key);

  @override
  _StarState createState() => _StarState();
}

class _StarState extends State<Star> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Task finishedTask = widget.task!;
        if (widget.task!.isImportant != true) {
          finishedTask.isImportant = true;
        } else {
          finishedTask.isImportant = false;
        }

        setState(() {
          Provider.of<TaskService>(context, listen: false)
              .editTask(finishedTask);
        });
      },
      child: widget.task!.isImportant!
          ? Icon(
              Icons.star,
              size: 30,
            )
          : Icon(
              Icons.star_border,
              size: 30,
            ),
    );
  }
}
