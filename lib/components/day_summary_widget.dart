import 'package:flutter/material.dart';
import 'package:flutter_weather/api/weather/dto/forecastday_response.dart';
import 'package:flutter_weather/commons/colors.dart';
import 'package:flutter_weather/components/card_title_widget.dart';
import 'package:flutter_weather/components/card_widget.dart';
import 'package:flutter_weather/components/condition_image_widget.dart';
import 'package:flutter_weather/components/container_widget.dart';
import 'package:flutter_weather/components/hourly_forecast_item_widget.dart';
import 'package:intl/intl.dart';

class DaySummaryWidget extends StatelessWidget {
  final ForecastdayResponse forecastdayResponse;

  const DaySummaryWidget({super.key, required this.forecastdayResponse});

  @override
  Widget build(BuildContext context) {
    final date = DateTime.parse(forecastdayResponse.date!);
    final formatedDate = DateFormat("EEEE, MMM yy").format(date);
    return ContainerWidget(
        child: CardWidget(
            child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                formatedDate,
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                height: 3,
              ),
              Text('${forecastdayResponse.day?.condition?.text}',
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: WeatherColors.textColorSubtitle)),
            ],
          ),
          Expanded(
            child: Container(
              height: 50,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '${forecastdayResponse.day?.maxtempC?.toInt()}°',
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                height: 3,
              ),
              Text('${forecastdayResponse.day?.mintempC?.toInt()}°',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.normal)),
            ],
          ),
          const SizedBox(
            width: 8,
          ),
          Container(
            color: Colors.black,
            width: 1,
            height: 51,
          ),
          const SizedBox(
            width: 8,
          ),
          ConditionImageWidget(
            width: 54,
            height: 54,
            fit: BoxFit.contain,
            alignment: Alignment.bottomCenter,
            conditionResponse: forecastdayResponse.day!.condition!,
          ),
        ],
      ),
    )));
  }
}
