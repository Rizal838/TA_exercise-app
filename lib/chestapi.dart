import 'dart:convert';
import 'package:exercise_app/chest.dart';
import 'package:http/http.dart' as http;

class ChestApi {
  static Future<List<Chest>> getChest() async {
    var uri = Uri.https('exercises-by-api-ninjas.p.rapidapi.com', '/v1/exercises',
        {'muscle': 'chest'});

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "a7823e44c0msh547a56e615bb21dp198052jsn5b2ae9a58adf",
      "x-rapidapi-host": "exercises-by-api-ninjas.p.rapidapi.com",
      "useQueryString": "true"
    });

    if (response.statusCode == 200) {
     List<Chest> chestList = ((json.decode(response.body) as List).map((i) => Chest.fromJson(i)).toList());
    return chestList;
  } else {
    throw Exception('Failed to load data');
  }
  }
}