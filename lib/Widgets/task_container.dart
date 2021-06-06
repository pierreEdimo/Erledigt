import 'package:erledigt/Model/edit_task_arguments.dart';
import 'package:erledigt/Model/task.dart';
import 'package:erledigt/Screens/edit_task_screen.dart';
import 'package:erledigt/Widgets/round_checkbox.dart';
import 'package:erledigt/Widgets/star.dart';
import 'package:flutter/material.dart';

class TaskContainer extends StatelessWidget {
  final Task? task;

  TaskContainer({Key? key, this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(
        EditTaskScreen.routeName,
        arguments: EditTaskArguments(task),
      ),
      child: Container(
        margin: EdgeInsets.only(bottom: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  child: RoundCheckbox(
                    task: task,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    task!.taskName!,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ],
            ),
            Star(
              task: task,
            )
          ],
        ),
      ),
    );
  }
}
