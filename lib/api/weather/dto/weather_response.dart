import 'package:flutter_weather/api/weather/dto/current_response.dart';
import 'package:flutter_weather/api/weather/dto/forecast_response.dart';
import 'package:flutter_weather/api/weather/dto/location_response.dart';

class WeatherResponse {
  LocationResponse? location;
  CurrentResponse? current;
  ForecastResponse? forecast;

  WeatherResponse({this.location, this.current, this.forecast});

  WeatherResponse.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? LocationResponse.fromJson(json['location'])
        : null;
    current =
    json['current'] != null ?  CurrentResponse.fromJson(json['current']) : null;
    forecast = json['forecast'] != null
        ? ForecastResponse.fromJson(json['forecast'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    if (this.current != null) {
      data['current'] = this.current!.toJson();
    }
    if (this.forecast != null) {
      data['forecast'] = this.forecast!.toJson();
    }
    return data;
  }
}
















