// POST http://suggestions.dadata.ru/suggestions/api/4_1/rs/suggest/address
//     {
// "query": "вол",
// "from_bound": { "value": "city" },
// "to_bound": { "value": "city" }
// }

import 'dart:convert';

import 'package:flutter_weather/api/dadata/dto/suggestions_response.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

const dadataUrl = 'http://suggestions.dadata.ru';
const dadataKey = '169785968f67b4ce16a4958232a400678337b712';

Future<SuggestionsResponse> fetchCity(String q) async {
  Uri uri = Uri.parse('$dadataUrl/suggestions/api/4_1/rs/suggest/address');
  Map<String, String> header = {
    'Authorization': "Token $dadataKey",
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };
  Map<String, dynamic> body = {
    "query": q,
    "from_bound": {"value": "city"},
    "to_bound": {"value": "city"}
  };
  String jsonBody = json.encode(body);
  final response = await http.post(uri, headers: header, body: jsonBody);

  if (response.statusCode != 200) {
    String body = response.body;
    throw Exception('Fetch request failed with code ${response.statusCode}');
  }

  Map<String, dynamic> jsonResponse = json.decode(response.body);
  return SuggestionsResponse.fromJson(jsonResponse);
}
