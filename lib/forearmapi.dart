import 'dart:convert';
import 'package:exercise_app/forearm.dart';
import 'package:http/http.dart' as http;

class ForearmApi {
  static Future<List<Forearm>> getForearm() async {
    var uri = Uri.https('exercises-by-api-ninjas.p.rapidapi.com', '/v1/exercises',
        {'muscle': 'forearms'});

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "a7823e44c0msh547a56e615bb21dp198052jsn5b2ae9a58adf",
      "x-rapidapi-host": "exercises-by-api-ninjas.p.rapidapi.com",
      "useQueryString": "true"
    });

    if (response.statusCode == 200) {
     List<Forearm> forearmList = ((json.decode(response.body) as List).map((i) => Forearm.fromJson(i)).toList());
    return forearmList;
  } else {
    throw Exception('Failed to load data');
  }
  }
}