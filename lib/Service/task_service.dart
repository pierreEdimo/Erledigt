import 'package:erledigt/Model/list_model.dart';
import 'package:erledigt/Model/task.dart';
import 'package:flutter/foundation.dart';

import 'package:erledigt/boxes.dart';

class TaskService extends ChangeNotifier {
  final _taskBox = Boxes.getTasks();

  void createTask(Task newTask, ListModel list) {
    _taskBox.add(newTask);
    notifyListeners();
  }

  getTasks(ListModel list) {
    List<Task> tasks = <Task>[];
    tasks = _taskBox.values
        .where(
          (x) => x.listKey == list.key,
        )
        .toList();
    return tasks;
  }

  deleTask(Task task) {
    task.delete();
    notifyListeners();
  }

  editTask(Task task) {
    task.save();
    notifyListeners();
  }
}
