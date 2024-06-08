import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather/api/weather/dto/hour_response.dart';
import 'package:flutter_weather/components/card_title_widget.dart';
import 'package:flutter_weather/components/card_widget.dart';
import 'package:flutter_weather/components/container_widget.dart';
import 'package:flutter_weather/components/line_chart_widget.dart';

class DayForecastWidget extends StatelessWidget {
  final List<HourResponse> hours;
  const DayForecastWidget({super.key, required this.hours});

  @override
  Widget build(BuildContext context) {
    List<FlSpot> spots = [];

    for(HourResponse hourResponse in hours){
      DateTime dateTime = DateTime.parse(hourResponse.time!);
      spots.add(FlSpot(dateTime.hour.toDouble(), hourResponse.tempC!));
    }

    return ContainerWidget(child: CardWidget(child:  Column(
      children: [
        const CardTitleWidget(
          title: 'day forecast',
          icon: Icons.calendar_month_outlined,
        ),
        const SizedBox(height: 8,),
        LineChartWidget(spots: spots,)
      ],
    )));

  }
}
