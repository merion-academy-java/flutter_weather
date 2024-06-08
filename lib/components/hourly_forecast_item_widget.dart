import 'package:flutter/material.dart';
import 'package:flutter_weather/api/weather/dto/hour_response.dart';
import 'package:flutter_weather/components/condition_image_widget.dart';
import 'package:intl/intl.dart';

class HourlyForecastItemWidget extends StatelessWidget {
  final HourResponse hourResponse;

  const HourlyForecastItemWidget({super.key, required this.hourResponse});

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(hourResponse.time!);
    String time = DateFormat('hh').format(dateTime);

    return Expanded(
      child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
      Text(
        '${time}am',
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
      ),
      const SizedBox(
        height: 0,
      ),
      ConditionImageWidget(
          width: 24,
          height: 32,
          fit: BoxFit.fitWidth,
          alignment: Alignment.bottomCenter,
          conditionResponse: hourResponse.condition!),
      const SizedBox(
        height: 8,
      ),
      Text(
        '${hourResponse.tempC?.toInt()}°',
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
      )
              ],
            ),
    );
  }
}
