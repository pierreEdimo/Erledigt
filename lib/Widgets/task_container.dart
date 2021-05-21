import 'package:erledigt/Model/task.dart';
import 'package:erledigt/Widgets/round_checkbox.dart';
import 'package:flutter/material.dart';

class TaskContainer extends StatelessWidget {
  final Task? task;

  TaskContainer({Key? key, this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25.0),
      margin: EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        children: [
          RoundCheckbox(
            isFinished: task!.isComplete,
            taskId: task!.id,
          ),
          SizedBox(
            width: 20.0,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(
              task!.taskName!,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
