import 'package:erledigt/Model/task.dart';
import 'package:erledigt/Widgets/task_container.dart';
import 'package:flutter/material.dart';

class ListOfTasks extends StatelessWidget {
  final List<Task>? tasks;
  final String? error;

  ListOfTasks({
    Key? key,
    this.tasks,
    this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return tasks!.length < 1
        ? Container(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Center(
              child: Text(
                error!,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12.0),
              ),
            ),
          )
        : ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: tasks!
                .map(
                  (Task task) => TaskContainer(
                    task: task,
                  ),
                )
                .toList(),
          );
  }
}
