import 'package:erledigt/Model/task.dart';
import 'package:erledigt/Widgets/show_modal.dart';
import 'package:erledigt/Widgets/task_container.dart';
import 'package:erledigt/Widgets/task_menu.dart';
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
        ? Center(
            child: Text(
              error!,
              textAlign: TextAlign.center,
            ),
          )
        : ListView(
            children: tasks!
                .map(
                  (Task task) => InkWell(
                    onTap: () => showCustomModal(
                      taskMenu(
                        task,
                        context,
                      ),
                      context,
                      MediaQuery.of(context).size.height * 0.31,
                    ),
                    child: TaskContainer(
                      task: task,
                    ),
                  ),
                )
                .toList(),
          );
  }
}
