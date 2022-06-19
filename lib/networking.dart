import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class FetchNews {
  String url;
  FetchNews({required this.url});

  Future<dynamic> getData() async {
    var parsedUrl = Uri.parse(url);
    var response = await http.get(parsedUrl, headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    });
    return convert.jsonDecode(response.body);
  }
}
