import 'dart:convert';

import 'package:flutter_weather/api/weather/dto/weather_response.dart';
import 'package:http/http.dart' as http;

const weatherKey = '27f26198d42c4d0bbe584005231912';
const weatherHost = 'https://api.weatherapi.com';

Future<WeatherResponse> fetchWeatherCurrent(String q) async {
  Uri uri = Uri.parse('$weatherHost/v1/forecast.json?'
      'key=$weatherKey'
      '&q=$q'
      '&days=7'
      '&aqi=no'
      '&alerts=no');
  Map<String, String> headers = {
    "Content-Type": "application/json; charset=utf-8",
  };
  final response = await http.get(uri, headers: headers);
  if (response.statusCode != 200) {
    throw Exception('Fetch weather data failed');
  }

  Map<String, dynamic> jsonData = json.decode(response.body);
  WeatherResponse weatherResponse = WeatherResponse.fromJson(jsonData);
  return weatherResponse;
}
