import 'package:erledigt/Model/list_model.dart';
import 'package:erledigt/Model/task.dart';
import 'package:erledigt/Service/task_service.dart';
import 'package:erledigt/Widgets/cancel_text_button.dart';
import 'package:erledigt/Widgets/dateTime_input.dart';
import 'package:erledigt/Widgets/description_input.dart';
import 'package:erledigt/Widgets/hour_input.dart';
import 'package:erledigt/Widgets/name_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

TextEditingController _controller = TextEditingController();
TextEditingController _descriptionController = TextEditingController();
TextEditingController _dateTimeController = TextEditingController();
TextEditingController _hourController = TextEditingController();

Widget addTaskForm(
  BuildContext context,
  ListModel list,
) {
  return Form(
      child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      nameInput(
        _controller,
        'Create a new Task',
        true,
      ),
      SizedBox(
        height: 20.0,
      ),
      descriptionInput(
        _descriptionController,
      ),
      SizedBox(
        height: 20.0,
      ),
      dateTimeInput(
        _dateTimeController,
        context,
      ),
      SizedBox(
        height: 20.0,
      ),
      hourInput(
        context,
        _hourController,
      ),
      SizedBox(
        height: 20.0,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          cancelTextButton(context),
          TextButton(
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                Task newTask = new Task(
                  taskName: _controller.text,
                  additionalNote: _descriptionController.text,
                  isComplete: false,
                  isImportant: false,
                  listKey: list.key,
                );

                if (_dateTimeController.text.isNotEmpty)
                  newTask.reminderTime =
                      DateTime.parse(_dateTimeController.text);

                if (_hourController.text.isNotEmpty)
                  newTask.reminderHour = _hourController.text;

                Provider.of<TaskService>(context, listen: false)
                    .createTask(newTask, list);

                Navigator.of(context).pop();

                _controller.clear();
                _descriptionController.clear();
              }

              DoNothingAction();
            },
            child: Text(
              'save',
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      )
    ],
  ));
}
