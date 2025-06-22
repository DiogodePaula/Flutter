import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'webclient.dart';

class AuthService {
  String url = WebClient.url;
  http.Client client = WebClient().client;

  Future<bool> login({required String email, required String password}) async {
    http.Response response = await client.post(Uri.parse("${url}login"), body: {
      "email": email,
      "password": password,
    });

    if (response.statusCode != 200) {
      if (response.statusCode == 404) {
        throw UserNotFindException();
      }
      throw HttpException(response.body);
    }

    saveUserInfo(response.body);
    return true;
  }

  Future<bool> register(String email, String password) async {
    http.Response response =
        await client.post(Uri.parse("${url}register"), body: {
      "email": email,
      "password": password,
    });

    if (response.statusCode != 201) {
      throw HttpException(response.body);
    }

    saveUserInfo(response.body);
    return true;
  }

  saveUserInfo(String body) async {
    Map<String, dynamic> map = json.decode(body);

    String token = map["accessToken"];
    String email = map["user"]["email"];
    String id = map["user"]["id"];

    // print("token: $token\nemail: $email\nid: $id");

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("accessToken", token);
    prefs.setString("email", email);
    prefs.setString("id", id);

    //forma de pegar o valor salvo em qualquer lugar da aplicação
    // String tokenSave = prefs.getString("accessToken") ?? "";
    // print("tokenSave: $tokenSave");
  }
}

class UserNotFindException implements Exception {}
