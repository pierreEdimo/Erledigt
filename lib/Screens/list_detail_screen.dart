import 'package:erledigt/Constants/constants.dart';
import 'package:erledigt/Model/list_detail_arguments.dart';
import 'package:erledigt/Model/task.dart';
import 'package:erledigt/Service/task_service.dart';
import 'package:erledigt/Widgets/add_task_form.dart';
import 'package:erledigt/Widgets/custom_app_bar.dart';
import 'package:erledigt/Widgets/custom_container.dart';
import 'package:erledigt/Widgets/list_menu.dart';
import 'package:erledigt/Widgets/list_of_tasks.dart';
import 'package:erledigt/Widgets/show_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListDetailScreen extends StatelessWidget {
  static const routeName = '/listdetail';

  @override
  Widget build(BuildContext context) {
    final ListDetailArguments args =
        ModalRoute.of(context)!.settings.arguments as ListDetailArguments;

    return Scaffold(
      appBar: customAppBar(
        Container(
          color: Colors.white,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: Icon(
                      Icons.keyboard_arrow_left_outlined,
                    ),
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  Text(
                    args.list!.name!,
                    style: titleStyle,
                  ),
                  InkWell(
                    child: Icon(
                      Icons.more_vert_outlined,
                    ),
                    onTap: () => showCustomModal(
                      listMenu(
                        context,
                        args.list!,
                      ),
                      context,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: CustomContainer(
        child: Consumer<TaskService>(
          builder: (context, task, child) {
            List<Task> tasks = task.getTasks(args.list!);

            return ListOfTasks(
              tasks: tasks,
              error: 'there are no Tasks in ${args.list!.name}\n' +
                  "please tap on '+' to create a new task",
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            showCustomModal(addTaskForm(context, args.list!), context),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
