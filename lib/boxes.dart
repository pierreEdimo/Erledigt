import 'package:erledigt/Model/list_model.dart';
import 'package:erledigt/Model/task.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<ListModel> getLists() => Hive.box<ListModel>('lists');

  static Box<Task> getTasks() => Hive.box<Task>('tasks');
}
