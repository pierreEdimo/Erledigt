import 'dart:convert';

import 'package:erledigt/Model/create_task.dart';
import 'package:erledigt/Model/task.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import '../main.dart';

class TaskService extends ChangeNotifier {
  Future<List<Task>> fetchTasks(int listId) async {
    String? userId = await storage.read(key: 'userId');

    Response response = await get(
      Uri.parse(
          'https://elerdigt-api.azurewebsites.net/api/ToDoItems/Filter?UserId=$userId&&ListId=$listId&&SortOrder=asc&&sortBy=isComplete'),
    );

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

      List<Task> tasks =
          body.map((dynamic task) => Task.fromJson(task)).toList();

      return tasks;
    } else {
      throw "No Lists";
    }
  }

  Future<List<Task>> queryTasks(String taskName) async {
    String? userId = await storage.read(key: 'userId');

    Response response = await get(
      Uri.parse(
          'https://elerdigt-api.azurewebsites.net/api/ToDoItems/Filter?UserId=$userId&&taskName=$taskName&&SortOrder=asc'),
    );

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

      List<Task> tasks =
          body.map((dynamic task) => Task.fromJson(task)).toList();

      return tasks;
    } else {
      throw "No Lists";
    }
  }

  Future<void> createTask(CreateTask newTask) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    String jsEncode;
    jsEncode = jsonEncode(newTask);
    await post(
      Uri.parse('https://elerdigt-api.azurewebsites.net/api/ToDoItems'),
      headers: headers,
      body: jsEncode,
    );
    notifyListeners();
  }

  Future<void> deleteTask(int id) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    await delete(
      Uri.parse('https://elerdigt-api.azurewebsites.net/api/ToDoItems/$id'),
      headers: headers,
    );
    notifyListeners();
  }

  Future<void> editTask(CreateTask editTask, int id) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    String jsEncode;
    jsEncode = jsonEncode(editTask);
    await put(
      Uri.parse('https://elerdigt-api.azurewebsites.net/api/ToDoItems/$id'),
      headers: headers,
      body: jsEncode,
    );
    notifyListeners();
  }

  Future<void> patchTask(bool isFinished, int id) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    await patch(
      Uri.parse('https://elerdigt-api.azurewebsites.net/api/ToDoItems/$id'),
      headers: headers,
      body: jsonEncode(
        [
          {
            "op": "replace",
            "path": "/isComplete",
            "value": isFinished,
          }
        ],
      ),
    );

    notifyListeners();
  }
}
