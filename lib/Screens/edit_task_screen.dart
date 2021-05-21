import 'package:erledigt/Constants/constants.dart';
import 'package:erledigt/Model/create_task.dart';
import 'package:erledigt/Model/edit_task_arguments.dart';
import 'package:erledigt/Service/task_service.dart';
import 'package:erledigt/Widgets/cancel_text_button.dart';
import 'package:erledigt/Widgets/custom_app_bar.dart';
import 'package:erledigt/Widgets/custom_container.dart';
import 'package:erledigt/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditTaskScreen extends StatelessWidget {
  static const routeName = '/edittask';
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final EditTaskArguments args =
        ModalRoute.of(context)!.settings.arguments as EditTaskArguments;
    return Scaffold(
      appBar: customAppBar(
        Container(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Edit Task",
                  style: titleStyle,
                ),
                IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Color(0xFFBFFFFFF),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                )
              ],
            ),
          ),
        ),
      ),
      body: CustomContainer(
        child: Form(
          child: Column(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _controller..text = args.task!.taskName!,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  cancelTextButton(context),
                  TextButton(
                    onPressed: () async {
                      if (_controller.text.isNotEmpty) {
                        String? userId = await storage.read(key: 'userId');
                        CreateTask editTask = CreateTask(
                          userId: userId,
                          taskName: _controller.text,
                          isComplete: args.task!.isComplete!,
                          isImportant: args.task!.isImportant!,
                          listId: args.task!.listId!,
                        );

                        Provider.of<TaskService>(context, listen: false)
                            .editTask(editTask, args.task!.id!);

                        Navigator.of(context).pop();
                      }
                    },
                    child: Text("save"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
