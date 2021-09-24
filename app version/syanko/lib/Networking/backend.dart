import 'dart:convert';

import 'package:http/http.dart' as http;

class Foodapi {
  Future fetchArea() async {
    http.Response res =
        await http.get(Uri.parse("http://10.0.2.2:5001/api/json/v1/list/area"));
    dynamic decoded = jsonDecode(res.body);
    return decoded;
  }

  Future fetchCategory() async {
    http.Response res = await http
        .get(Uri.parse("http://10.0.2.2:5001/api/json/v1/list/category"));
    dynamic decoded = jsonDecode(res.body);
    return decoded;
  }

  Future fetchSpecificArea(String name) async {
    http.Response res = await http
        .get(Uri.parse("http://10.0.2.2:5001/api/json/v1/filter?a=$name"));
    dynamic decoded = jsonDecode(res.body);
    return decoded;
  }

  Future fetchSpecificCategory(String name) async {
    http.Response res = await http
        .get(Uri.parse("http://10.0.2.2:5001/api/json/v1/filter?c=$name"));
    dynamic decoded = jsonDecode(res.body);
    return decoded;
  }

  Future fetchById(String id) async {
    http.Response res = await http
        .get(Uri.parse("http://10.0.2.2:5001/api/json/v1/lookup?i=$id"));
    dynamic decoded = jsonDecode(res.body);
    return decoded;
  }
}
