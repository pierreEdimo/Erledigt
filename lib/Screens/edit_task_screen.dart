import 'package:erledigt/Model/edit_task_arguments.dart';
import 'package:erledigt/Model/task.dart';
import 'package:erledigt/Service/task_service.dart';
import 'package:erledigt/Widgets/custom_app_bar.dart';
import 'package:erledigt/Widgets/custom_container.dart';
import 'package:erledigt/Widgets/dateTime_input.dart';
import 'package:erledigt/Widgets/description_input.dart';
import 'package:erledigt/Widgets/hour_input.dart';
import 'package:erledigt/Widgets/name_input.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EditTaskScreen extends StatelessWidget {
  static const routeName = '/edittask';
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateTimeController = TextEditingController();
  final TextEditingController _hourController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final EditTaskArguments args =
        ModalRoute.of(context)!.settings.arguments as EditTaskArguments;
    _controller.text = args.task!.taskName!;
    _descriptionController.text = args.task!.additionalNote!;
    if (args.task!.reminderTime != null)
      _dateTimeController.text =
          DateFormat("yyyy-MM-dd").format(args.task!.reminderTime!);

    if (args.task!.reminderHour != null)
      _hourController.text = args.task!.reminderHour!;

    return Scaffold(
      appBar: customAppBar(
        Container(
          color: Color(0xffbffffff),
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: Icon(Icons.keyboard_arrow_left_outlined),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () async {
                          if (_controller.text.isNotEmpty) {
                            Task finishedTask = args.task!;
                            finishedTask.taskName = _controller.text;
                            finishedTask.additionalNote =
                                _descriptionController.text;

                            finishedTask.reminderTime =
                                DateTime.parse(_dateTimeController.text);

                            finishedTask.reminderHour = _hourController.text;

                            Provider.of<TaskService>(context, listen: false)
                                .editTask(finishedTask);
                          }
                          DoNothingAction();
                        },
                        child: Icon(Icons.save_outlined),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      InkWell(
                        onTap: () {
                          Provider.of<TaskService>(context, listen: false)
                              .deleTask(args.task!);

                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.delete_outlined,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: CustomContainer(
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
                nameInput(
                  _controller,
                  "",
                  false,
                ),
                SizedBox(
                  height: 40.0,
                ),
                descriptionInput(
                  _descriptionController,
                ),
                SizedBox(
                  height: 40.0,
                ),
                dateTimeInput(
                  _dateTimeController,
                  context,
                ),
                SizedBox(
                  height: 40.0,
                ),
                hourInput(
                  context,
                  _hourController,
                ),
                SizedBox(
                  height: 20.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
