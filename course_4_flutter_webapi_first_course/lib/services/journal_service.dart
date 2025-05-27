import 'package:http/http.dart' as http;

class JournalService {
  static const String url = "http://192.168.1.104:3001/";
  static const String resource = "learnhttp/";

  String getUrl() {
    return "$url$resource";
  }

  register(String content) {
    http.post(Uri.parse(getUrl()), headers: {
      "Content-Type": "application/json"
    }, body: {
      "content": content,
      "createdAt": DateTime.now().toIso8601String()
    });
  }

  Future<String> get() async {
    http.Response response = await http.get(Uri.parse(getUrl()));
    return response.body;
  }
}
