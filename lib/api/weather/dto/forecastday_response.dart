import 'package:flutter_weather/api/weather/dto/astronomy_response.dart';
import 'package:flutter_weather/api/weather/dto/day_response.dart';
import 'package:flutter_weather/api/weather/dto/hour_response.dart';

class ForecastdayResponse {
  String? date;
  int? dateEpoch;
  DayResponse? day;
  AstroResponse? astro;
  List<HourResponse>? hour;

  ForecastdayResponse({this.date, this.dateEpoch, this.day, this.astro, this.hour});

  ForecastdayResponse.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    dateEpoch = json['date_epoch'];
    day = json['day'] != null ? DayResponse.fromJson(json['day']) : null;
    astro = json['astro'] != null ? AstroResponse.fromJson(json['astro']) : null;
    if (json['hour'] != null) {
      hour = <HourResponse>[];
      json['hour'].forEach((v) {
        hour!.add(HourResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['date_epoch'] = this.dateEpoch;
    if (this.day != null) {
      data['day'] = this.day!.toJson();
    }
    if (this.astro != null) {
      data['astro'] = this.astro!.toJson();
    }
    if (this.hour != null) {
      data['hour'] = this.hour!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}