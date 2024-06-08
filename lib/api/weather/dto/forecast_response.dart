import 'package:flutter_weather/api/weather/dto/forecastday_response.dart';

class ForecastResponse {
  List<ForecastdayResponse>? forecastday;

  ForecastResponse({this.forecastday});

  ForecastResponse.fromJson(Map<String, dynamic> json) {
    if (json['forecastday'] != null) {
      forecastday = <ForecastdayResponse>[];
      json['forecastday'].forEach((v) {
        forecastday!.add(ForecastdayResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.forecastday != null) {
      data['forecastday'] = this.forecastday!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}