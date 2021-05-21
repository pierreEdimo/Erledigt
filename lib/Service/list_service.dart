import 'dart:convert';

import 'package:erledigt/Model/create_list.dart';
import 'package:erledigt/Model/list_model.dart';
import 'package:erledigt/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class ListService extends ChangeNotifier {
  ListService() {
    fetchLists();
  }

  Future<List<ListModel>> fetchLists() async {
    String? userId = await storage.read(key: 'userId');
    Response response = await get(
      Uri.parse(
          'https://elerdigt-api.azurewebsites.net/api/lists/Filter?userId=$userId&&SortOrder=asc'),
    );

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

      List<ListModel> lists =
          body.map((dynamic list) => ListModel.fromJson(list)).toList();

      return lists;
    } else {
      throw "No Lists";
    }
  }

  Future<ListModel> createList(CreateList newList) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    String jsEncode;
    jsEncode = jsonEncode(newList);
    final Response response = await post(
      Uri.parse('https://elerdigt-api.azurewebsites.net/api/lists/'),
      headers: headers,
      body: jsEncode,
    );
    notifyListeners();
    if (response.statusCode == 201) {
      return ListModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load List");
    }
  }

  Future<void> updateList(CreateList newList, int id) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    String jsEncode;
    jsEncode = jsonEncode(newList);
    await put(
      Uri.parse('https://elerdigt-api.azurewebsites.net/api/lists/$id'),
      body: jsEncode,
      headers: headers,
    );
    notifyListeners();
  }

  Future<void> deleteList(int id) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    await delete(
      Uri.parse('https://elerdigt-api.azurewebsites.net/api/lists/$id'),
      headers: headers,
    );
    notifyListeners();
  }
}
