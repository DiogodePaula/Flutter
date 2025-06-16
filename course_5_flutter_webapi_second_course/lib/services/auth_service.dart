import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'http_interceptors.dart';

class AuthService {
  static const String url = "http://192.168.1.100:3000/";

  http.Client client = InterceptedClient.build(
    interceptors: [
      LoggingInterceptor(),
    ],
  );

  login({required String email, required String password}) async {
    http.Response response = await client.post(Uri.parse("${url}login"), body: {
      "email": email,
      "password": password,
    });

    if (response.statusCode != 200) {
      throw HttpException(response.body);
    }

    saveUserInfo(response.body);
  }

  register(String email, String password) async {
    http.Response response =
        await client.post(Uri.parse("${url}register"), body: {
      "email": email,
      "password": password,
    });

    if (response.statusCode != 201) {
      throw HttpException(response.body);
    }

    saveUserInfo(response.body);
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
    String tokenSave = prefs.getString("accessToken") ?? "";
    // print("tokenSave: $tokenSave");
  }
}
