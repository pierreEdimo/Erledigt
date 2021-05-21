import 'package:erledigt/Model/task.dart';
import 'package:erledigt/Widgets/list_of_tasks.dart';
import 'package:flutter/material.dart';

class QueryListOfTask extends StatelessWidget {
  final Future<List<Task>>? tasks;

  QueryListOfTask({Key? key, this.tasks}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: tasks,
      builder: (BuildContext context, AsyncSnapshot<List<Task>> snapshot) {
        if (snapshot.hasData) {
          List<Task> tasks = snapshot.data!;

          return ListOfTasks(
            tasks: tasks,
            error: 'sorry , no task found',
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
