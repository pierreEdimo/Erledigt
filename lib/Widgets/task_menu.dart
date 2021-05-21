import 'package:erledigt/Model/edit_task_arguments.dart';
import 'package:erledigt/Model/task.dart';
import 'package:erledigt/Screens/edit_task_screen.dart';
import 'package:erledigt/Service/task_service.dart';
import 'package:erledigt/Widgets/list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget taskMenu(
  Task task,
  BuildContext context,
) {
  return Column(
    children: [
      InkWell(
        onTap: () {
          Navigator.of(context).pop();

          Navigator.pushNamed(
            context,
            EditTaskScreen.routeName,
            arguments: EditTaskArguments(
              task,
            ),
          );
        },
        child: listTile(
          Icon(Icons.edit_outlined),
          'edit Task',
        ),
      ),
      InkWell(
        onTap: () {
          Provider.of<TaskService>(context, listen: false).deleteTask(task.id!);
          Navigator.of(context).pop();
        },
        child: listTile(
          Icon(Icons.delete_outlined),
          'delete Task',
        ),
      ),
      InkWell(
        onTap: () => Navigator.of(context).pop(),
        child: listTile(
          Icon(Icons.cancel_outlined),
          'cancel',
        ),
      )
    ],
  );
}
