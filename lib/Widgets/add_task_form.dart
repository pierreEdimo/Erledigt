import 'package:erledigt/Model/create_task.dart';
import 'package:erledigt/Service/task_service.dart';
import 'package:erledigt/Widgets/cancel_text_button.dart';
import 'package:erledigt/Widgets/name_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';

Widget addTaskForm(
  TextEditingController controller,
  BuildContext context,
  int listId,
) {
  return Form(
      child: Column(
    children: [
      nameInput(
        controller,
        'Create a new Task',
      ),
      SizedBox(
        height: 20.0,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          cancelTextButton(context),
          TextButton(
            onPressed: () async {
              if (controller.text.isNotEmpty) {
                String? userId = await storage.read(key: 'userId');
                CreateTask newTask = CreateTask(
                    userId: userId,
                    isComplete: false,
                    isImportant: false,
                    taskName: controller.text,
                    listId: listId);

                Provider.of<TaskService>(context, listen: false)
                    .createTask(newTask);

                Navigator.of(context).pop();

                controller.text = "";
              }

              DoNothingAction();
            },
            child: Text('save'),
          )
        ],
      )
    ],
  ));
}
