import 'package:flutter/material.dart';
import 'package:flutter_weather/api/weather/dto/forecastday_response.dart';
import 'package:flutter_weather/components/card_title_widget.dart';
import 'package:flutter_weather/components/card_widget.dart';
import 'package:flutter_weather/components/container_widget.dart';
import 'package:flutter_weather/components/hourly_forecast_item_widget.dart';

class HourlyForecastWidget extends StatelessWidget {
  final ForecastdayResponse forecastdayResponse;
  const HourlyForecastWidget({super.key, required this.forecastdayResponse});

  @override
  Widget build(BuildContext context) {


    return ContainerWidget(
        child: CardWidget(
            child: Column(
      children: [
        const CardTitleWidget(
          title: 'Hourly forecast',
          icon: Icons.access_time_rounded,
        ),
        const SizedBox(height: 8,),
        Row(children: [
          HourlyForecastItemWidget(hourResponse: forecastdayResponse.hour![0]),
          HourlyForecastItemWidget(hourResponse: forecastdayResponse.hour![1]),
          HourlyForecastItemWidget(hourResponse: forecastdayResponse.hour![2]),
          HourlyForecastItemWidget(hourResponse: forecastdayResponse.hour![3]),
          HourlyForecastItemWidget(hourResponse: forecastdayResponse.hour![4]),
          HourlyForecastItemWidget(hourResponse: forecastdayResponse.hour![5]),
          HourlyForecastItemWidget(hourResponse: forecastdayResponse.hour![6]),
        ],)
      ],
    )));
  }
}
