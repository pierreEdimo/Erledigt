import 'dart:convert';
import 'package:erledigt/Model/logged_user_model.dart';

import '../main.dart';
import 'package:erledigt/Model/login_model.dart';
import 'package:erledigt/Model/register_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AuthService extends ChangeNotifier {
  Future<int> registerUser(RegisterModel registerModel) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    String jsEncode;
    jsEncode = jsonEncode(registerModel);
    var url =
        Uri.parse('https://elerdigt-api.azurewebsites.net/api/User/Register');
    final Response response = await post(
      url,
      headers: headers,
      body: jsEncode,
    );

    if (response.statusCode == 200) {
      String jwt = response.body;
      storage.write(key: "jwt", value: jwt);
    } else if (response.statusCode == 500) {
      return response.statusCode;
    } else {
      throw "Error";
    }

    return response.statusCode;
  }

  Future<int> loginUser(LoginModel loginModel) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    String jsEncode;
    var url =
        Uri.parse('https://elerdigt-api.azurewebsites.net/api/User/Login');
    jsEncode = jsonEncode(loginModel);
    final Response response = await post(
      url,
      headers: headers,
      body: jsEncode,
    );

    if (response.statusCode == 200) {
      String jwt = response.body;
      print(jwt);
      storage.write(key: "jwt", value: jwt);
    } else if (response.statusCode == 500) {
      return response.statusCode;
    } else {
      throw "error";
    }

    return response.statusCode;
  }

  Future<LoggedUser> fetchSingleUser() async {
    String? authorization = await storage.read(key: "jwt");
    var url =
        Uri.parse('https://elerdigt-api.azurewebsites.net/api/User/GetUser');
    final Response response = await get(
      url,
      headers: {
        'Authorization': 'Bearer ' + authorization!,
      },
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      storage.write(key: "userId", value: responseJson['id']);
      print(responseJson['id']);
      return LoggedUser.fromJson(responseJson);
    } else {
      throw "Error";
    }
  }
}
