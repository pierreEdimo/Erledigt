import 'package:erledigt/Model/edit_list_arguments.dart';
import 'package:erledigt/Model/list_model.dart';
import 'package:erledigt/Model/task.dart';
import 'package:erledigt/Service/list_service.dart';
import 'package:erledigt/Service/task_service.dart';
import 'package:erledigt/Widgets/add_task_form.dart';
import 'package:erledigt/Widgets/custom_app_bar.dart';
import 'package:erledigt/Widgets/custom_container.dart';
import 'package:erledigt/Widgets/description_input.dart';
import 'package:erledigt/Widgets/list_of_tasks.dart';
import 'package:erledigt/Widgets/name_input.dart';
import 'package:erledigt/Widgets/show_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditListScreen extends StatelessWidget {
  static const routeName = 'editList';
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final EditListArguments args =
        ModalRoute.of(context)!.settings.arguments as EditListArguments;

    _controller.text = args.listModel!.name!;
    _descriptionController.text = args.listModel!.description!;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            showCustomModal(addTaskForm(context, args.listModel!), context),
        child: Icon(
          Icons.add_outlined,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: customAppBar(
        Container(
          color: Color(0xffbffffff),
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(
                    Icons.keyboard_arrow_left_outlined,
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      child: Icon(Icons.save_outlined),
                      onTap: () {
                        if (_controller.text.isNotEmpty) {
                          ListModel editedList = args.listModel!;
                          editedList.name = _controller.text;
                          editedList.description = _descriptionController.text;

                          Provider.of<ListService>(context, listen: false)
                              .editList(args.listModel!);
                        }
                      },
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    InkWell(
                      onTap: () {
                        Provider.of<ListService>(context, listen: false)
                            .deleList(args.listModel!);
                        Navigator.popUntil(
                          context,
                          ModalRoute.withName('/'),
                        );
                      },
                      child: Icon(Icons.delete_outlined),
                    )
                  ],
                )
              ],
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
                Consumer<TaskService>(
                  builder: (context, task, child) {
                    List<Task> tasks = task.getTasks(args.listModel!);

                    return ListOfTasks(
                      tasks: tasks,
                      error: 'there are no Tasks in ${args.listModel!.name}\n' +
                          "please tap on '+' to create a new task",
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
