import 'dart:convert';

import 'package:flutter_webapi_first_course/models/journal.dart';
import 'package:flutter_webapi_first_course/services/http_interceptors.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart';

class JournalService {
  static const String url = "http://192.168.1.104:3001/";
  static const String resource = "journals/";

  http.Client client = InterceptedClient.build(
    interceptors: [LoggingInterceptor()],
    requestTimeout: const Duration(seconds: 5),
  );

  String getUrl() {
    return "$url$resource";
  }

  Future<bool> register(Journal journal) async {
    String jsonJournal = json.encode(journal.toMap());

    http.Response response = await client.post(Uri.parse(getUrl()),
        headers: {"Content-Type": "application/json"}, body: jsonJournal);

    if (response.statusCode == 201) {
      return true;
    }

    return false;
  }

  Future<List<Journal>> getAll() async {
    http.Response response = await client.get(Uri.parse(getUrl()));

    if (response.statusCode != 200) {
      throw Exception("Error fetching journals");
    }

    List<Journal> journals = [];

    // cada objeto dentro da lista e um map, precisa transformar esse map em journal
    List<dynamic> listDynamic = json.decode(response.body);

    for (var item in listDynamic) {
      journals.add(Journal.fromMap(item));
    }

    return journals;
  }
}
