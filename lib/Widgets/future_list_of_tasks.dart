import 'package:erledigt/Model/task.dart';
import 'package:erledigt/Service/task_service.dart';
import 'package:erledigt/Widgets/custom_rounded_button.dart';
import 'package:erledigt/Widgets/list_of_tasks.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_task_form.dart';

class FutureListOfTask extends StatelessWidget {
  final int? id;

  final TextEditingController _controller = TextEditingController();

  FutureListOfTask({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<TaskService>(context).fetchTasks(id!),
      builder: (BuildContext context, AsyncSnapshot<List<Task>> snapshot) {
        if (snapshot.hasData) {
          List<Task> tasks = snapshot.data!;

          return Stack(
            children: [
              ListOfTasks(
                tasks: tasks,
                error:
                    'there are no tasks yet \n , please tap "+" to create a new one',
              ),
              Positioned(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: CustomRoundedButton(
                    child: addTaskForm(
                      _controller,
                      context,
                      id!,
                    ),
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                ),
              ),
            ],
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
