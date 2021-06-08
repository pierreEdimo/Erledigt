import 'package:erledigt/Model/list_model.dart';
import 'package:erledigt/Model/task.dart';
import 'package:erledigt/boxes.dart';
import 'package:flutter/cupertino.dart';

class ListService extends ChangeNotifier {
  final _listBox = Boxes.getLists();
  final _taskBox = Boxes.getTasks();

  void createNewList(ListModel listModel) {
    _listBox.add(listModel);
    notifyListeners();
  }

  getLists() {
    List<ListModel> lists = <ListModel>[];
    lists = _listBox.values.toList();
    return lists;
  }

  getTaskCount(ListModel? list) {
    List<Task> tasks = <Task>[];
    tasks = _taskBox.values.where((x) => x.listKey == list!.key).toList();
    return tasks.length;
  }

  deleList(ListModel listModel) {
    listModel.delete();
    notifyListeners();
  }

  editList(ListModel listModel) {
    listModel.save();
    notifyListeners();
  }
}
