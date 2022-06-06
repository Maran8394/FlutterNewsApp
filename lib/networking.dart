import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class FetchNews {
  String url;
  FetchNews({required this.url});

  Future<dynamic> getData() async {
    var URL = Uri.parse(url);
    var response = await http.get(URL, headers: {'Accept': 'application/json'});
    return convert.jsonDecode(response.body);
  }
}
